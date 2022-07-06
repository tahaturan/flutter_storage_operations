import 'package:flutter_storage_operations/model/kategoriler.dart';
import 'package:flutter_storage_operations/model/yonetmenler.dart';

class Filmler {
  int filmId;
  String filmAdi;
  int filmYili;
  String filmResim;
  Kategoriler kategori;
  Yonetmenler yonetmen;

  Filmler(this.filmId, this.filmAdi, this.filmYili, this.filmResim,
      this.kategori, this.yonetmen);
}
