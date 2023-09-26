import 'package:flutter/material.dart';
import 'package:muvime/functions/resize_string.dart';

import '../../functions/dynamic_size_calculator.dart';
import '../Datas/my_constants.dart';
import '../models/cast.dart';

class CastCard extends StatelessWidget {
  const CastCard({
    super.key,
    required this.cast,
  });
  final Cast cast;

  @override
  Widget build(BuildContext context) {
    double cardsWidth = 330; // dynamicWidth(context, 0.8);
    double cardsHeight = dynamicHeight(context, 0.12);
    double imageHeight = cardsHeight * 0.65;

    return Card(
      elevation: 10,
      shadowColor: myBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          width: cardsWidth,
          height: cardsHeight,
          decoration: const BoxDecoration(
            color: myBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: dynamicHeight(context, 0.015),
                ),
                Container(
                  color: myBackgroundColor,
                  width: (cardsWidth / 5.2),
                  height: imageHeight,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: ClipOval(
                      child: cast.photo ??
                          Container(
                            color: Colors.black, // Siyah arka plan
                            child: const Center(
                              child: Icon(
                                Icons.person, // Siyah daire içinde kişi ikonu
                                color: Colors.white,
                                size: 40.0,
                              ),
                            ),
                          ),
                    ),
                  ),
                ),
                SizedBox(
                  width: dynamicHeight(context, 0.02),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: dynamicHeight(context, 0.015),
                    ),
                    SizedBox(
                      width: cardsWidth * 0.6,
                      child: Name(
                        name: cast.name!.length >
                                17 // eğer çok uzunsa ilk kelimeyi al.
                            ? getFirstWords(cast.name!, 1)
                            : getFirstWords(cast.name!, 2),
                      ),
                    ),
                    SizedBox(
                      height: dynamicHeight(context, 0.005),
                    ),
                    SizedBox(
                      width: cardsWidth / 1.7,
                      height: cardsHeight / 5,
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        child: Character(
                          character: getFirstWords(cast.character!,
                              1), // adın yalnızca ilk kelimesini alıyorum
                        ),
                      ),
                    ),
                    SizedBox(
                      height: dynamicHeight(context, 0.001),
                    ),
                    Popularity(
                      popularity: cast.popularity!,
                    ),
                    SizedBox(
                      height: dynamicHeight(context, 0.008),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Name extends StatelessWidget {
  const Name({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.left,
      name,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: myTitleLargeColor,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}

class Popularity extends StatelessWidget {
  const Popularity({
    super.key,
    required this.popularity,
  });
  final String popularity;
  @override
  Widget build(BuildContext context) {
    return Text(
      "popularity: $popularity",
      // '2h 23m / 2021',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: myBodyLargeColor,
            fontWeight: FontWeight.w400,
          ),
    );
  }
}

class Character extends StatelessWidget {
  const Character({
    super.key,
    required this.character,
  });
  final String character;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.left,
      character,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: myBodyLargeColor,
            fontWeight: FontWeight.w800,
          ),
    );
  }
}
