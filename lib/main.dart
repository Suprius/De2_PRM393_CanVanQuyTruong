import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'views/chitieu_list_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  final prefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(child: ChiTieuApp(prefs: prefs)));
}

class ChiTieuApp extends StatefulWidget {
  const ChiTieuApp({super.key, required this.prefs});

  final SharedPreferences prefs;

  @override
  State<ChiTieuApp> createState() => _ChiTieuAppState();
}

class _ChiTieuAppState extends State<ChiTieuApp> {
  late String currency;

  @override
  void initState() {
    super.initState();
    currency = widget.prefs.getString('currency') ?? 'VND';
  }

  void changeCurrency(String value) {
    widget.prefs.setString('currency', value);
    setState(() => currency = value);
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
    home: ChiTieuListPage(
      currency: currency,
      onCurrencyChanged: changeCurrency,
    ),
  );
}
