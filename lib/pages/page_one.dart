import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  Future<void> veriOku() async {
    var sp = await SharedPreferences.getInstance();
    //*todo: verileri okumak icinde get metodlarini kullaniriz ve bizden key degeri bekler
    String ad = sp.getString("ad") ?? "isim yok";
    //? ?? kullanmamizin sebebi ise eger key deferinde bir deger bulamazsa yani null sa diger isim yok degerini ada aktar demis oluyoruz
    int yas = sp.getInt("yas") ?? 0;
    double boy = sp.getDouble("boy") ?? 0.0;
    bool bekarMi = sp.getBool("bekarMi") ?? false;
    List<String>? arkadasListe = sp.getStringList("arkadasListe");

    debugPrint("Ad: $ad");
    debugPrint("Yas: $yas");
    debugPrint("Boy: $boy");
    debugPrint("Bekar mi: $bekarMi");

    for (var i in arkadasListe!) {
      debugPrint("Arkadas: $i");
    }
  }

  @override
  void initState() {
    super.initState();
    veriOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page One'),
      ),
      body: const Center(),
    );
  }
}
