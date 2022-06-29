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
    List<Kisiler> liste = await KisilerDao().tumKisiler();
    //*ilk olarak tum kisilerimize eristik ve bize bir icinde kisiler nesneleri olan liste gelecegini biliyoruz
    //* artik veritabanimizda kac tane nesne varsa liste icine gelmis oldu bizde bunu basit bir for dongusu ile konsola yazdirabiliriz

    for (Kisiler kisi in liste) {
      print("**************");
      print("kisi id: ${kisi.kisi_id}");
      print("kisi adi: ${kisi.kisi_ad}");
      print("kisi yas: ${kisi.kisi_yas}");
    }
  }

  Future<void> veriEkle() async {
    await KisilerDao().kisiEkle("Zehra", 18);
  }

  @override
  void initState() {
    //*uygulama ilk acildiginizda calismasini istedigimiz seyleri initStade icine yazariz
    //todo: bizde acilir acilmaz kisileriGoster() metodumuzun calismasini istedik
    super.initState();
    veriEkle();
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
