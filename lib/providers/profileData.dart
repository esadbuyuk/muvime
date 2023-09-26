import 'dart:io';

import 'package:flutter/material.dart';

class Profile {
  File? _photo;
  String? _name;

  Profile({required File? photo, String? name}) {
    _photo = photo;
    _name = name ?? "Serkan Konakçı";
  }

  File? get photo => _photo;
  String? get name => _name;

  set photo(File? newPhoto) {
    _photo = newPhoto;
  }

  set name(String? newName) {
    _name = newName;
  }
}

class ProfileProvider extends ChangeNotifier {
  Profile _profile = Profile(photo: null, name: "Serkan Konakçı");

  Profile get profile => _profile;

  void changeProfilePhoto(File newPhoto) {
    _profile.photo = newPhoto;
    notifyListeners();
  }

  void changeUserName(String newName) {
    _profile.name = newName;
    notifyListeners();
  }
}
