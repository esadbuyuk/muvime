class TmdbApi {
  static const String _baseUrl = "https://api.themoviedb.org";
  static const String _key = "05e01dec53bdadc4c845c8c830404d00";
  // static const String _sessionId =
  //     "KULLANICI_OTURUM_ID"; // Kullanıcı oturum kimliği

  static const String _popularMoviesUrl =
      '$_baseUrl/3/trending/movie/day?api_key=$_key';
  static const String _freeMoviesUrl =
      '$_baseUrl/3/movie/top_rated?api_key=$_key';

  static const String _searchResultUrl =
      "https://api.themoviedb.org/3/search/movie?api_key=05e01dec53bdadc4c845c8c830404d00&query=";

  static const String _genreListUrl =
      "$_baseUrl/3/genre/movie/list?api_key=$_key";

  static String getPopularMoviesUrl() {
    return _popularMoviesUrl;
  }

  static String getMoreLikeThisUrl(int movieId) {
    return "https://api.themoviedb.org/3/movie/$movieId/similar?api_key=$_key";
  }

  static String getMovieCast(int movieId) {
    return "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$_key";
  }

  static String getFreeMoviesUrl() {
    return _freeMoviesUrl;
  }

  static String getSearchResultUrl() {
    return _searchResultUrl;
  }

  static String getGenreListUrl() {
    return _genreListUrl;
  }
}
