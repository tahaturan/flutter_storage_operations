import 'package:flutter/material.dart';
import 'package:flutter_storage_operations/pages/page_one.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKullanimi extends StatefulWidget {
  const SharedPreferencesKullanimi({Key? key}) : super(key: key);

  @override
  State<SharedPreferencesKullanimi> createState() =>
      _SharedPreferencesKullanimiState();
}

class _SharedPreferencesKullanimiState
    extends State<SharedPreferencesKullanimi> {
  Future<void> veriKaydi() async {
    //*uygulamamizin daha performansli olmasi icin future kullandik
    //? sp = shared preferences
    var sp = await SharedPreferences.getInstance();
    //*burada sp diye degisken olusturup yetki aldik await dememizin sebebi SharedPreferences.getInstance() yapisinin olusmasini bekle oyle asagidaki kodlara gec
    //*bitmeden gecerse hatalar alabiliriz
    //*islemlerimizi de sp uzerinden yapicaz

    sp.setString("ad", "taha");
    //todo: key-value iliskisi vardir ilk kisima key diger kisim ise value degerini gireriz
    //*biz verileri okurken veya silerken  burdaki keyleri kullanacagiz
    sp.setInt("yas", 18);
    sp.setDouble("boy", 1.85);
    sp.setBool("bekarMi", true);

    List<String> arkadasListe = ["Selin", "Taha"];
    sp.setStringList("arkadasListe", arkadasListe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences Kullanimi'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PageOne(),
                  ),
                );
                veriKaydi();
              },
              child: const Text(
                "Gecis Yap",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
