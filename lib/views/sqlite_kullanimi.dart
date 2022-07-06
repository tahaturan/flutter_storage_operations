import 'package:flutter/material.dart';
import 'package:flutter_storage_operations/database/fimler_dao.dart';
import 'package:flutter_storage_operations/database/kisiler_dao.dart';
import 'package:flutter_storage_operations/database/veritabani_yardimcisi_filmler.dart';
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
    await KisilerDao().kisiEkle("Taha", 25);
  }

  Future<void> veriSil() async {
    await KisilerDao().kisiSil(29);
  }

  Future<void> veriGuncelle() async {
    await KisilerDao().kisiGuncelle(33, "Yeni Isim", 20);
  }

  Future<void> kayitKontrol() async {
    int sonuc = await KisilerDao().kayitKontrol("Taha");
    print("Veritabaninda taha ismi $sonuc adet gecmektedir");
  }

  Future<void> kisigetir() async {
    var kisi = await KisilerDao().kisiGetir(31);

    print("Id: ${kisi.kisi_id}");
    print("Ad: ${kisi.kisi_ad}");
    print("Yas: ${kisi.kisi_yas}");
  }

  Future<void> aramaYap() async {
    List<Kisiler> liste = await KisilerDao().kisiArama("a");

    for (var i in liste) {
      print("Id: ${i.kisi_id}");
      print("Ad: ${i.kisi_ad}");
      print("Yas: ${i.kisi_yas}");
    }
  }

  Future<void> rastgeleIkiKisiGetir() async {
    var liste = await KisilerDao().rastgeleneIkiKisiGetir();

    for (var element in liste) {
      print("Id: ${element.kisi_id}");
      print("Adi: ${element.kisi_ad}");
      print("Yasi: ${element.kisi_yas}");
    }
  }

  Future<void> filmleriGoster() async {
    var liste = await FilmlerDao().tumFilmler();

    for (var film in liste) {
      print("*************************");
      print("Film Id: ${film.filmId}");
      print("Film Adi: ${film.filmAdi}");
      print("Film Yili: ${film.filmYili}");
      print("Film Resim: ${film.filmResim}");
      print("Film Kategori: ${film.kategori.kategoriAd}");
      print("Film Yonetmeni: ${film.yonetmen.yonetmenAdi}");
    }
  }

  @override
  void initState() {
    //*uygulama ilk acildiginizda calismasini istedigimiz seyleri initStade icine yazariz
    //todo: bizde acilir acilmaz kisileriGoster() metodumuzun calismasini istedik
    super.initState();
    //veriEkle();
    //veriSil();
    //veriGuncelle();
    //kayitKontrol();
    //kisileriGoster();
    //kisigetir();
    //aramaYap();
    //rastgeleIkiKisiGetir();
    filmleriGoster();
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
