import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SayacUygulamasi extends StatefulWidget {
  const SayacUygulamasi({Key? key}) : super(key: key);

  @override
  State<SayacUygulamasi> createState() => _SayacUygulamasiState();
}

class _SayacUygulamasiState extends State<SayacUygulamasi> {
  int sayac = 0;
  Future<void> sayacKontrol() async {
    var sp = await SharedPreferences.getInstance();

    sayac = sp.getInt("sayac") ?? 0;
    setState(() {
      sayac++;
    });

    sp.setInt("sayac", sayac);
  }

  @override
  void initState() {
    super.initState();
    sayacKontrol();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sayac'),
      ),
      body: Center(
        child: Text(
          "Acilis Sayisi= $sayac",
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
