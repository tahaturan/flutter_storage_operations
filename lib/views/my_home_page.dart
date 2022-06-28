import 'package:flutter/material.dart';
import 'package:flutter_storage_operations/views/sayac_uygulamasi.dart';
import 'package:flutter_storage_operations/views/shared_preferences_kullanimi.dart';
import 'package:flutter_storage_operations/views/sqlite_kullanimi.dart';
import 'package:flutter_storage_operations/widgets/sayfa_gecis_buton.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Sayfa'),
      ),
      body: Center(
        child: Column(
          children: [
            SayfaGecisBtn(
              butonName: "Shared Preferences",
              page: const SharedPreferencesKullanimi(),
            ),
            SayfaGecisBtn(
                butonName: "SP Sayac Uygulamasi",
                page: const SayacUygulamasi()),
            SayfaGecisBtn(
                butonName: "Sqlite Kullanimi", page: const SqliteKullanimi()),
          ],
        ),
      ),
    );
  }
}
