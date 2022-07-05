//?Dao = database access object
import 'package:flutter_storage_operations/database/veritabani_yardimcisi.dart';
import 'package:flutter_storage_operations/model/kisiler.dart';

class KisilerDao {
  //*biz veri okumak isitoyiruz ve bunun icin bir metid olusturucaz bu metod bize kisiler nesnlerini bulunduran bir liste dondurecek
  Future<List<Kisiler>> tumKisiler() async {
    //? biz icinde kisiler nesneleri olan bir liste dondurmeye calisicaz
    //? veritabanindaki satirlari tek tek okuyup bu sekilde dondurmeye calisicaz
    //*once veri tabanimiza eriselim
    var db = await VeritabaniYardimcisi.veriTabaniErisim();
    //*await dedik yani bu islem bitene kadar bekle diger kodlarara gecme islmelerimizi bunun uzerinden yapicaz cunku hata almayalim
    //* artik db uzerinden veritabani islemlerimizi yapabiliriz
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM kisiler");
    //*rawQuery ile sorgu yapabiliyoruz "SELECT * FROM kisiler burada kisiler tablosundaki verileri alip maps icine aticak
    //? simdi de maps icindeki alan bilgilerini alip kisi nesnleri olusturucaz

    return List.generate(maps.length, (index) {
      //*oncelikle maps icindeki bilgileri satir satir alicaz
      var satir = maps[index];

      return Kisiler(satir["kisi_id"], satir["kisi_ad"], satir["kisi_yas"]);
    });
  }

  Future<void> kisiEkle(String kisiAdi, int kisiYas) async {
    var db = await VeritabaniYardimcisi.veriTabaniErisim();
    var bilgiler = Map<String, dynamic>();
    bilgiler["kisi_ad"] = kisiAdi;
    bilgiler["kisi_yas"] = kisiYas;

    await db.insert("kisiler", bilgiler);
  }

  Future<void> kisiSil(int kisiId) async {
    var db = await VeritabaniYardimcisi.veriTabaniErisim();

    await db.delete("kisiler", where: "kisi_id = ?", whereArgs: [kisiId]);
  }

  Future<void> kisiGuncelle(int kisiId, String kisiAd, int kisiYas) async {
    var db = await VeritabaniYardimcisi.veriTabaniErisim();

    var bilgiler = <String, dynamic>{};
    bilgiler["kisi_ad"] = kisiAd;
    bilgiler["kisi_yas"] = kisiYas;

    await db
        .update("kisiler", bilgiler, where: "kisi_id = ?", whereArgs: [kisiId]);
  }

  Future<int> kayitKontrol(String kisiAd) async {
    var db = await VeritabaniYardimcisi.veriTabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT count(*) AS sonuc FROM kisiler WHERE kisi_ad = '$kisiAd'");
    return maps[0]["sonuc"];
  }

  Future<Kisiler> kisiGetir(int kisiId) async {
    var db = await VeritabaniYardimcisi.veriTabaniErisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM kisiler WHERE kisi_id ='$kisiId'");
    var satir = maps[0];

    return Kisiler(satir["kisi_id"], satir["kisi_ad"], satir["kisi_yas"]);
  }

  Future<List<Kisiler>> kisiArama(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veriTabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM kisiler WHERE kisi_ad like '%$aramaKelimesi%'");
    return List.generate(maps.length, (index) {
      var satir = maps[index];

      return Kisiler(satir["kisi_id"], satir["kisi_ad"], satir["kisi_yas"]);
    });
  }
}
