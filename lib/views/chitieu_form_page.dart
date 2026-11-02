import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/category.dart';
import '../models/chitieu.dart';

class ChiTieuFormPage extends StatefulWidget {
  const ChiTieuFormPage({
    super.key,
    required this.chitieu,
    required this.categories,
  });

  final ChiTieu chitieu;
  final List<Category> categories;

  @override
  State<ChiTieuFormPage> createState() => _ChiTieuFormPageState();
}

class _ChiTieuFormPageState extends State<ChiTieuFormPage> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController amountController;
  late int categoryId;
  late DateTime date;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.chitieu.name);
    amountController = TextEditingController(
      text: widget.chitieu.amount.toStringAsFixed(0),
    );
    categoryId = widget.chitieu.categoryId;
    date = widget.chitieu.date;
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  Future<void> pickDate() async {
    final result = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (result != null) setState(() => date = result);
  }

  void save() {
    if (!formKey.currentState!.validate()) return;
    Navigator.pop(
      context,
      ChiTieu(
        id: widget.chitieu.id,
        name: nameController.text.trim(),
        amount: double.parse(amountController.text),
        categoryId: categoryId,
        date: date,
      ),
    );
  }

  InputDecoration decoration() =>
      const InputDecoration(border: OutlineInputBorder());

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
      title: const Text('Chỉnh sửa khoản chi'),
    ),
    body: Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Tên khoản chi *'),
          TextFormField(
            controller: nameController,
            decoration: decoration(),
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Vui lòng nhập tên'
                : null,
          ),
          const SizedBox(height: 16),
          const Text('Số tiền *'),
          TextFormField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: decoration(),
            validator: (value) => double.tryParse(value ?? '') == null
                ? 'Số tiền không hợp lệ'
                : null,
          ),
          const SizedBox(height: 16),
          const Text('Danh mục *'),
          DropdownButtonFormField<int>(
            initialValue: categoryId,
            decoration: decoration(),
            items: widget.categories
                .map(
                  (item) =>
                      DropdownMenuItem(value: item.id, child: Text(item.name)),
                )
                .toList(),
            onChanged: (value) => categoryId = value!,
          ),
          const SizedBox(height: 16),
          const Text('Ngày chi tiêu *'),
          InkWell(
            onTap: pickDate,
            child: InputDecorator(
              decoration: decoration(),
              child: Text(DateFormat('dd/MM/yyyy').format(date)),
            ),
          ),
          const SizedBox(height: 28),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Hủy'),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: FilledButton(onPressed: save, child: const Text('Lưu')),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
