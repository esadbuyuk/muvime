import 'dart:io';

import 'package:flutter/material.dart';

import '../models/movie.dart';

class Profile {
  File? _photo;
  String? _username;
  String? _password;
  List<Movie> _favoriteMovies = [];

  Profile({
    required File? photo,
    String? username,
    String? password,
  }) {
    _photo = photo;
    _username = username ?? "SerkanKonakci"; // Varsayılan kullanıcı adı
    _password = password ?? "Parola123"; // Varsayılan parola
  }

  File? get photo => _photo;
  String? get username => _username;
  String? get password => _password;

  set photo(File? newPhoto) {
    _photo = newPhoto;
  }

  set username(String? newUsername) {
    _username = newUsername;
  }

  set password(String? newPassword) {
    _password = newPassword;
  }

  void addToFavorite(Movie movie) {
    if (!_favoriteMovies.contains(movie)) {
      _favoriteMovies.add(movie);
      print("$movie eklendi.");
    } else {
      _favoriteMovies.remove(movie);
      print("$movie zaten listede var.");
    }
  }
}

class ProfileProvider extends ChangeNotifier {
  Profile _profile = Profile(photo: null, username: "SerkanKonakci");

  Profile get profile => _profile;

  void changeProfilePhoto(File newPhoto) {
    _profile.photo = newPhoto;
    notifyListeners();
  }

  void changeUsername(String newUsername) {
    _profile.username = newUsername;
    notifyListeners();
  }

  void changePassword(String newPassword) {
    _profile.password = newPassword;
    notifyListeners();
  }

  void addToFavorite(Movie movie) {
    _profile.addToFavorite(movie);
  }
}
