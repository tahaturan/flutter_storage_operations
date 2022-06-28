import 'package:flutter/material.dart';

class SqliteKullanimi extends StatefulWidget {
  const SqliteKullanimi({Key? key}) : super(key: key);

  @override
  State<SqliteKullanimi> createState() => _SqliteKullanimiState();
}

class _SqliteKullanimiState extends State<SqliteKullanimi> {
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
