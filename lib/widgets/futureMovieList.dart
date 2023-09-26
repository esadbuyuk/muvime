import 'package:flutter/material.dart';
import 'package:muvime/Datas/my_constants.dart';

import '../Datas/services/movieListData.dart';
import '../functions/dynamic_size_calculator.dart';
import '../models/movie.dart';
import 'movie_card_widgets/movie_card.dart';

class FutureMovieList extends StatefulWidget {
  const FutureMovieList({
    super.key,
    required this.moviesDataUrl,
  });

  final String moviesDataUrl;

  @override
  State<FutureMovieList> createState() => _FutureMovieListState();
}

class _FutureMovieListState extends State<FutureMovieList> {
  late Future<List<Movie>>? _futureMovieList;

  @override
  void initState() {
    super.initState();
    _futureMovieList = callFutureMovieList(widget.moviesDataUrl);
  }

  // Widget çağırıldığında çalışır.
  void changeMovieList() {
    super.didChangeDependencies();
    setState(() {
      _futureMovieList = callFutureMovieList(widget.moviesDataUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    changeMovieList();

    return FutureBuilder<List<Movie>>(
      future: _futureMovieList,
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          List<Movie> myList = snapshot.data!;
          return MovieList(myList: myList);
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("No movies found matching your query."),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
    required List<Movie> myList,
  }) : _myList = myList;

  final List<Movie> _myList;

  @override
  Widget build(BuildContext context) {
    double sidePaddings = dynamicWidth(context, 0.03) + 16;
    return SizedBox(
      height: 500, // bunu kaldırmayı deneyecem.
      child: ListView.separated(
        addAutomaticKeepAlives: false,
        scrollDirection: Axis.horizontal,
        itemCount: moviePerList,
        // controller: PageController(
        //     viewportFraction:
        //         0.5), // Belirli bir aralıkta durması için viewportFraction kullanılır

        itemBuilder: (context, index) => MovieCard(
          movie: _myList[index],
        ),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 30,
          );
        },
        padding: EdgeInsets.only(
          left: isDeviceMobile ? sidePaddings : 0,
          right: isDeviceMobile ? sidePaddings : 0,
        ),
      ),
    );
  }
}
