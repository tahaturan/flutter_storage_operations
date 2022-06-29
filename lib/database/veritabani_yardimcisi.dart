import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi {
  static const String veritabaniAdi = "rehber.sqlite";
  //*ilk olrak sabit bir degisken olusturuduk burada veri tabanimizin ismini verdik daha sonra kullnamak icin

  static Future<Database> veriTabaniErisim() async {
    //*performansli olmasi icin future turunde olusuturduk ve bu metod sayesinde veri tabanina erismeye calisicaz
    //? veritabani uygulama icinde bir dosya yolunda yer alir burada onu kontrol edecegiz yani bu veri tabani o dosya yolunda var mi yok mu
    //?eger veri tabani o dosya yolunda varsa direk erisim saglicaz
    //?eger veri tabani o dosya yolunda yer almiyorsa yani uygluamda yoksa o veri tabanini uygulamaya kopyala dicez
    //* yani genel olarak bu veritabani uygulama icine kopyalanmis mi kopyalanmamis mi onu kontrol edicez
    //*eger kopyalanmissa tekrar kopyalama islemi yapmicaz
    //*eger kopyalanmamissa daha onceden kopyalama islemini gerceklestiricez ve daha sonra veritabanina erisicez

    //todo: ilk olarak veritabni yolunda veritabani var mi yok mu bunu kotrol etmemiz gerekiyor
    //todo: bunun ilk ilk olarak veritabani yolunu elde etmemiz gerekiyor
    String veritabaniYolu = join(await getDatabasesPath(), veritabaniAdi);
    //todo: getDatabasesPath() metodu sayesinde veri tabani yolunu alabiliyoruz alirkende await dedik bunu alirken bekletmem gerekiyor ilk olarak bu islemin bitmesini beklemeyoiz yoksa hata aliriz
    //todo: yukarida tanimladigimiz veri tabani adimizida verdik bu sekilde veritabani yolu + veritabanini birlestirmis olduk bu sekilde veritabanimiza tam dosya yolu olarak erismis olduk
    //*ve bu sayede biz bu veritabani daha once kopyalnamis mi kopyalanmamis mi bunu kontrol edebiliriz
    if (await databaseExists(veritabaniYolu)) {
      //todo:databaseExists() metodu yolu verdigimiz zaman o veritabani orda var mi yok mu onu kontrol ediyor
      print("Veritabani zaten var kopyalamaya gerek yok");
      //*yani veritabani varsa tekrar kopyalama islemi yapmicaz
      //! yine await ile olusturduk cunku bu islem bitmeden diger islmelree gecmesini istemiyoruz
    } else {
      //*veritabani yoksa da else kismi calisir burada da kopyalama islemi yapmamiz lazimki islemler yapabilelim
      //todo: biz kopyalama ioslemi yaparken mesela rehber.sqlite dosyasini alicaz cihazin icine kayit edicez bunun icinde o dosyayi alip byte dosyasina donusturmeliyiz
      ByteData data = await rootBundle.load("veritabani/$veritabaniAdi");
      //*bu sekilde yolunu belirtelrek veri tabanimiza erismis oluruz
      //todo: simdi de veritabanimizi byte turune cevirmemiz lazim eristik ya
      //!bu donusumde bize list gelecek ve biz bu list i yazidirma islemiyle yazdiricaz
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      //*bu sekilde byte a donusturmus olduk
      //todo: simdide biz bunu artik kopyalayabiliriz
      await File(veritabaniYolu).writeAsBytes(bytes, flush: true);
      print("Veritabani Kopyalandi");
    }
    return openDatabase(veritabaniYolu);
  }
}
