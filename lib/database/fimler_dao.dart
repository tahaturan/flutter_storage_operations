import 'package:flutter_storage_operations/database/veritabani_yardimcisi_filmler.dart';
import 'package:flutter_storage_operations/model/filmler.dart';
import 'package:flutter_storage_operations/model/kategoriler.dart';
import 'package:flutter_storage_operations/model/yonetmenler.dart';

class FilmlerDao {
  Future<List<Filmler>> tumFilmler() async {
    var db = await VeriTabaniYardimcisiFilmler.veriTabaniErisimFilmler();

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM filmler,kategoriler,yonetmenler WHERE filmler.kategori_id = kategoriler.kategori_id and filmler.yonetmen_id = yonetmenler.yonetmen_id");

    return List.generate(maps.length, (index) {
      var satir = maps[index];

      var kategori = Kategoriler(satir["kategori_id"], satir["kategori_ad"]);
      var yonetmen = Yonetmenler(satir["yonetmen_id"], satir["yonetmen_ad"]);
      var filmler = Filmler(satir["film_id"], satir["film_ad"],
          satir["film_yil"], satir["film_resim"], kategori, yonetmen);

      return filmler;
    });
  }
}
