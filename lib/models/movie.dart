import 'package:flutter/material.dart';

class Movie {
  Image? image;
  String? title;
  String? genre;
  String? releaseDate;
  String? time;
  String? imdb;
  String? overview;
  int? id;
  String? backdropPath;

  // final Details details;

  Movie(
      {this.image,
      this.title,
      this.genre,
      this.releaseDate,
      this.time,
      this.imdb,
      this.overview,
      this.id,
      this.backdropPath});
}
