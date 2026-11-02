import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../models/category.dart';
import '../models/chitieu.dart';
import '../viewmodels/category_view_model.dart';
import '../viewmodels/chitieu_view_model.dart';
import 'chitieu_form_page.dart';

class ChiTieuListPage extends ConsumerWidget {
  const ChiTieuListPage({
    super.key,
    required this.currency,
    required this.onCurrencyChanged,
  });

  final String currency;
  final ValueChanged<String> onCurrencyChanged;

  Future<void> edit(
    BuildContext context,
    WidgetRef ref,
    ChiTieu chitieu,
    List<Category> categories,
  ) async {
    final result = await Navigator.push<ChiTieu>(
      context,
      MaterialPageRoute(
        builder: (_) =>
            ChiTieuFormPage(chitieu: chitieu, categories: categories),
      ),
    );
    if (result != null) {
      await ref.read(chiTieuViewModelProvider.notifier).save(result);
    }
  }

  String categoryName(int id, List<Category> categories) {
    return categories.firstWhere((item) => item.id == id).name;
  }

  String money(double amount) => currency == 'VND'
      ? '${NumberFormat('#,##0', 'en_US').format(amount)} VND'
      : '\$${NumberFormat('#,##0.00', 'en_US').format(amount)}';

  void showSettings(BuildContext context) {
    var selected = currency;
    showDialog<void>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Đơn vị tiền tệ'),
          content: RadioGroup<String>(
            groupValue: selected,
            onChanged: (value) => setDialogState(() => selected = value!),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile(value: 'VND', title: Text('VND (Việt Nam Đồng)')),
                RadioListTile(value: 'USD', title: Text('USD (Đô la Mỹ)')),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            FilledButton(
              onPressed: () {
                onCurrencyChanged(selected);
                Navigator.pop(context);
              },
              child: const Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chitieuState = ref.watch(chiTieuViewModelProvider);
    final categoryState = ref.watch(categoryViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: const Text('Quản lý chi tiêu'),
        actions: [
          IconButton(
            onPressed: () => showSettings(context),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: categoryState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Lỗi: $error')),
        data: (categories) => chitieuState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('Lỗi: $error')),
          data: (items) => ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: items.length, 
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                child: ListTile(
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(DateFormat('dd/MM/yyyy').format(item.date)),
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Chip(
                        label: Text(categoryName(item.categoryId, categories)),
                      ),
                      const Spacer(),
                      Text(
                        money(item.amount),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => edit(context, ref, item, categories),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
