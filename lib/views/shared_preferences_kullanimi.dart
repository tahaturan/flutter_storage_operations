import 'package:flutter/material.dart';

class SharedPreferencesKullanimi extends StatefulWidget {
  const SharedPreferencesKullanimi({Key? key}) : super(key: key);

  @override
  State<SharedPreferencesKullanimi> createState() =>
      _SharedPreferencesKullanimiState();
}

class _SharedPreferencesKullanimiState
    extends State<SharedPreferencesKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences Kullanimi'),
      ),
      body: Container(),
    );
  }
}
