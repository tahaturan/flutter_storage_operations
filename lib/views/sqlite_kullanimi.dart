import 'package:flutter/material.dart';
import 'package:flutter_storage_operations/database/kisiler_dao.dart';
import 'package:flutter_storage_operations/model/kisiler.dart';

class SqliteKullanimi extends StatefulWidget {
  const SqliteKullanimi({Key? key}) : super(key: key);

  @override
  State<SqliteKullanimi> createState() => _SqliteKullanimiState();
}

class _SqliteKullanimiState extends State<SqliteKullanimi> {
  Future<void> kisileriGoster() async {
    var liste = await KisilerDao().tumKisiler();
    for (Kisiler k in liste) {
      print("Kisi id: ${k.kisi_id}");
      print("Kisi ad: ${k.kisi_ad}");
      print("Kisi yas: ${k.kisi_yas}");
      print("-----------------");
    }
  }

  @override
  void initState() {
    super.initState();
    kisileriGoster();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqlite Kullanimi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [],
        ),
      ),
    );
  }
}
