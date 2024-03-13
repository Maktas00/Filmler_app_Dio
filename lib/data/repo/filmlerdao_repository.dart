 import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:filmler_app_boot/data/entity/filmler.dart';
import 'package:filmler_app_boot/data/entity/filmler_cevap.dart';

class FilmlerdaoRepository{

  List<Filmler> parseFilmler(String cevap){
    return FilmlerCevap.fromJson(jsonDecode(cevap)).filmler;

  }


  Future<List<Filmler>> filmleriYukle() async {
    var url="http://kasimadalan.pe.hu/filmler_yeni/tum_filmler.php";
    var cevap=await Dio().get(url);
    return parseFilmler(cevap.data.toString());
  }
}