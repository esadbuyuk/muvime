import 'package:flutter/material.dart';

class Cast {
  Image? _photo;
  String? _name; // adın yalnızca ilk iki kelimesini alıyorum
  String? _character;
  String? _popularity;
  String? _department;

  Cast({
    Image? photo,
    String? name,
    String? character,
    String? popularity,
    String? department,
  }) {
    _photo = photo;
    _name = name;
    _character = character;
    _popularity = popularity;
    _department = department;
  }

  Image? get photo => _photo;
  String? get name => _name;
  String? get character => _character;
  String? get popularity => _popularity;
  String? get department => _department;

  set photo(Image? newPhoto) {
    _photo = newPhoto;
  }

  set name(String? newName) {
    _name = newName;
  }

  set character(String? newCharacter) {
    _character = newCharacter;
  }

  set popularity(String? newPopularity) {
    _popularity = newPopularity;
  }

  set department(String? newDepartment) {
    _department = newDepartment;
  }
}
