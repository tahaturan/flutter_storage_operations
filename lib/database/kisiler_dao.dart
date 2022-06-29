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
}
