import 'package:flutter_storage_operations/database/veritabani_yardimcisi.dart';
import 'package:flutter_storage_operations/model/kisiler.dart';

class KisilerDao {
  Future<List<Kisiler>> tumKisiler() async {
    var db = await VeriTabaniYardimcisi.vertabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM kisiler");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Kisiler(satir["kisi_id"], satir["kisi_ad"], satir["kisi_yas"]);
    });
  }
}
