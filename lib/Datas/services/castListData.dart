import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../models/cast.dart';

Future<List<Cast>> callFutureCastList(String castDataUrl) async {
  var topCastsData = await http.get(
    Uri.parse(castDataUrl),
  );
  var topCastsDataParsed = jsonDecode(topCastsData.body);
  var topCastList = topCastsDataParsed["cast"];

  Cast createCast({required int index}) {
    String? profilePath = topCastList[index]["profile_path"];

    // Eğer profilePath null değilse, resmi oluştur
    Image? photo = profilePath != null
        ? Image.network(
            "https://image.tmdb.org/t/p/w300$profilePath",
          )
        : null;

    return Cast(
      photo: photo,
      name: topCastList[index]["name"],
      character: topCastList[index]["character"],
      popularity: (topCastList[index]["popularity"] ?? "-").toString(),
      department:
          (topCastList[index]["known_for_department"] ?? "-").toString(),
    );
  }

  List<Cast> list = [
    createCast(index: 0),
    createCast(index: 1),
    createCast(index: 2),
    createCast(index: 3),
    createCast(index: 5),
    createCast(index: 6),
    createCast(index: 7),
  ];
  return list;
}
