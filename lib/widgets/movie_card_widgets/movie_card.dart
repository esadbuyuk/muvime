import 'package:flutter/material.dart';
import 'package:muvime/widgets/movie_card_widgets/title.dart';
import 'package:provider/provider.dart';

import '../../functions/dynamic_size_calculator.dart';
import '../../functions/resize_string.dart';
import '../../models/movie.dart';
import '../../providers/profileData.dart';
import '../../screens/details_page.dart';
import 'genre.dart';
import 'imdb.dart';
import 'time_and_year.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({super.key, required this.movie});

  final Movie movie;

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    double cardsWidth = 200; // dynamicWidth(context, 0.50);
    double imageHeight = 300; // dynamicHeight(context, 0.35);

    String extractYearFromDateString(String dateString) {
      List<String> dateParts = dateString.split("-");
      if (dateParts.isNotEmpty) {
        return dateParts[0];
      } else {
        return ""; // Eğer hatalı bir tarih gelirse boş bir dize döndür.
      }
    }

    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 0, //isDeviceMobile ? dynamicWidth(context, 0.03) + 16 : 0,
        end: 0, //isDeviceMobile ? 25 : 50,
      ),
      child: GestureDetector(
        onTap: () {
          // tıklanan filmi detay sayfasında göster
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(movie: widget.movie),
            ),
          );
        },
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: cardsWidth,
                height: imageHeight,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: widget.movie.image ??
                            Container(
                              color: Colors.black,
                              child: const Center(
                                child: Icon(
                                  Icons
                                      .movie_creation_outlined, // Siyah daire içinde film ikonu
                                  color: Colors.white,
                                  size: 40.0,
                                ),
                              ),
                            ), // image,
                      ),
                      Positioned(
                        top: cardsWidth / 20,
                        right: cardsWidth / 12,
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<ProfileProvider>(context, listen: false)
                                .addToFavorite(widget.movie);

                            // provider ile favoriler listene ekle
                            toggleFavorite();
                          },
                          child: Icon(
                            // favorilere ekle butonu
                            Icons.favorite,
                            color: isFavorite ? Colors.red : Colors.grey[300],
                            size: 90.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: dynamicHeight(context, 0.02),
              ),
              SizedBox(
                width: cardsWidth,
                child: MovieTitle(
                  title: getFirstWords(widget.movie.title!, 5),
                ),
              ),
              SizedBox(
                height: dynamicHeight(context, 0.02),
              ),
              SizedBox(
                width: cardsWidth,
                child: Genre(
                  genre: getFirstWords(widget.movie.genre!, 4),
                ),
              ),
              SizedBox(
                height: dynamicHeight(context, 0.01),
              ),
              SizedBox(
                width: cardsWidth,
                child: Row(
                  children: [
                    TimeAndYear(
                      year:
                          extractYearFromDateString(widget.movie.releaseDate!),
                      time: widget.movie.time!,
                    ),
                    const Expanded(
                      child: SizedBox(
                          // width: dynamicWidth(context, 0.03),
                          ),
                    ),
                    Imdb(
                      imdb: widget.movie.imdb!,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
