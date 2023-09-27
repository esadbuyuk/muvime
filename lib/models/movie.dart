import 'package:flutter/material.dart';

class Movie {
  Image? _image;
  String? _title;
  String? _genre;
  String? _releaseDate;
  String? _time;
  String? _imdb;
  String? _overview;
  int? _id;
  String? _backdropPath;

  // constructor
  Movie({
    Image? image,
    String? title,
    String? genre,
    String? releaseDate,
    String? time,
    String? imdb,
    String? overview,
    int? id,
    String? backdropPath,
  }) {
    _image = image;
    _title = title;
    _genre = genre;
    _releaseDate = releaseDate;
    _time = time;
    _imdb = imdb;
    _overview = overview;
    _id = id;
    _backdropPath = backdropPath;
  }

  Image? get image => _image;
  String? get title => _title;
  String? get genre => _genre;
  String? get releaseDate => _releaseDate;
  String? get time => _time;
  String? get imdb => _imdb;
  String? get overview => _overview;
  int? get id => _id;
  String? get backdropPath => _backdropPath;

  set image(Image? newImage) {
    _image = newImage;
  }

  set title(String? newTitle) {
    _title = newTitle;
  }

  set genre(String? newGenre) {
    _genre = newGenre;
  }

  set releaseDate(String? newReleaseDate) {
    _releaseDate = newReleaseDate;
  }

  set time(String? newTime) {
    _time = newTime;
  }

  set imdb(String? newImdb) {
    _imdb = newImdb;
  }

  set overview(String? newOverview) {
    _overview = newOverview;
  }

  set id(int? newId) {
    _id = newId;
  }

  set backdropPath(String? newBackdropPath) {
    _backdropPath = newBackdropPath;
  }
}
