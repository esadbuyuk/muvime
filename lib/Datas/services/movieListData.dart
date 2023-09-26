import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../models/movie.dart';
import '../services/tmdb_api.dart';

Future<List<Movie>> callFutureMovieList(String moviesDataUrl) async {
  List<int> movieIds = [];
  Map<int, String> idToRuntimeMap = {};
  var freeMoviesData = await http.get(
    Uri.parse(moviesDataUrl),
  );
  var freeMoviesDataParsed = jsonDecode(freeMoviesData.body);
  var freeMoviesList = freeMoviesDataParsed["results"];
  var genresData = await http.get(
    Uri.parse(
      TmdbApi.getGenreListUrl(),
    ),
  );
  var genresDataParsed = jsonDecode(genresData.body);
  for (Map element in freeMoviesList) {
    movieIds.add(element["id"]);
  }

  Future<int> getRuntimeData({required int movieId}) async {
    var runtime = await http.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId?api_key=05e01dec53bdadc4c845c8c830404d00',
      ),
    );
    var runtimeParsed = jsonDecode(runtime.body);

    return runtimeParsed["runtime"];
  }

  Future<Map<int, String>> buildIdToRuntimeMap() async {
    for (int id in movieIds) {
      var runtime = await getRuntimeData(movieId: id);
      idToRuntimeMap[id] = runtime.toString();
    }

    return idToRuntimeMap;
  }

  Map runtimeMap = await buildIdToRuntimeMap();

  String findGenre(int targetId) {
    List genres = genresDataParsed["genres"];

    // Aranan ID'ye sahip elemanı bulma
    Map<String, dynamic> targetGenre = genres.firstWhere(
      (genre) => genre['id'] == targetId,
    );
    return targetGenre["name"];
  }

  String changeIdsToGenres(String genreIds) {
    List<int> stringToList(String input) {
      // Köşeli parantezleri kaldırma
      input = input.replaceAll("[", "").replaceAll("]", "");
      // String ifadeyi virgüllere göre bölmek
      List<String> stringValues = input.split(",");

      // String değerlerini integer'a çevirme ve sonucu bir liste olarak döndürme
      List<int> intValues =
          stringValues.map((value) => int.tryParse(value.trim()) ?? 0).toList();

      return intValues;
    }

    List genresList = [];
    List genreIdsList = stringToList(genreIds);
    for (var id in genreIdsList) {
      String genre = findGenre(id);
      genresList.add(genre);
    }
    String genres =
        genresList.toString().replaceAll("[", "").replaceAll("]", "");

    return genres;
  }

  Movie createMovie({required int index}) {
    String? imagePath = freeMoviesList[index]["poster_path"];

    // Eğer imagePath null değilse, resmi oluştur
    Image? image = imagePath != null
        ? Image.network("https://image.tmdb.org/t/p/w500$imagePath",
            filterQuality: FilterQuality.high, fit: BoxFit.fill)
        : null;

    String timeCalculator() {
      int minutesOfMovie = int.parse(runtimeMap[freeMoviesList[index]["id"]]);

      String convertMinutesToTime(int minutes) {
        if (minutes < 0) {
          return "Geçersiz süre";
        }

        int hours = minutes ~/ 60; // Saat hesaplaması
        int remainingMinutes = (minutes % 60).toInt(); // Kalan dakikalar

        String hourString = hours.toString();
        String minuteString = remainingMinutes.toString();

        if (minuteString == '0') {
          return "$hourString h";
        } else {
          return "$hourString h $minuteString m";
        }
      }

      return convertMinutesToTime(minutesOfMovie);
    }

    return Movie(
      image: image,
      title: freeMoviesList[index]["title"],
      genre: changeIdsToGenres(freeMoviesList[index]["genre_ids"].toString()),
      releaseDate: freeMoviesList[index]["release_date"],
      time: timeCalculator(),
      imdb: freeMoviesList[index]["vote_average"].toStringAsFixed(2),
      id: freeMoviesList[index]["id"],
      overview: freeMoviesList[index]["overview"],
      backdropPath: freeMoviesList[index]["backdrop_path"],
    );
  }

  List<Movie> list = [
    createMovie(index: 0),
    createMovie(index: 1),
    createMovie(index: 2),
    createMovie(index: 3),
    createMovie(index: 5),
    createMovie(index: 6),
    createMovie(index: 7),
    createMovie(index: 8),
    createMovie(index: 9),
    createMovie(index: 10),
    createMovie(index: 11),
    createMovie(index: 12),
  ];
  return list;
}
