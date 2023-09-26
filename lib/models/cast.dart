import 'package:flutter/material.dart';

class Cast {
  Image? photo;
  String? name; // adın yalnızca ilk iki kelimesini alıyorum
  String? character;
  String? popularity;
  String? department;

  Cast({
    this.photo,
    this.name,
    this.character,
    this.popularity,
    this.department,
  });
}
