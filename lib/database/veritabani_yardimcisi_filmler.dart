import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeriTabaniYardimcisiFilmler {
  static const String veriTabaniAdi = "filmler.sqlite";

  static Future<Database> veriTabaniErisimFilmler() async {
    String veriTabaniYolu = join(await getDatabasesPath(), veriTabaniAdi);

    if (await databaseExists(veriTabaniYolu)) {
      print("Veri tabani zaten kopyalanmis");
    } else {
      ByteData data = await rootBundle.load("veritabani/$veriTabaniAdi");

      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(veriTabaniYolu).writeAsBytes(bytes, flush: true);
      print("Veri tabani Cihaza Kopyalandi");
    }
    return openDatabase(veriTabaniYolu);
  }
}
