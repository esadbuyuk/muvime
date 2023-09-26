import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Datas/my_constants.dart';
import '../functions/dynamic_size_calculator.dart';
import '../models/movie.dart';
import 'my_button.dart';

class DetailsPageHero extends StatelessWidget {
  const DetailsPageHero({
    super.key,
    required this.backdropImagePath,
    required this.sidePaddings,
    required this.movie,
    required this.details,
  });

  final String backdropImagePath;
  final double sidePaddings;
  final Movie movie;
  final String details;

  @override
  Widget build(BuildContext context) {
    double spaceBetween = dynamicHeight(context, 0.03);

    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          image: NetworkImage(backdropImagePath),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(sidePaddings),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: spaceBetween,
                ),
                Title(movie: movie),
                SizedBox(
                  height: spaceBetween / 2,
                ),
                Details(details: details),
                SizedBox(
                  height: spaceBetween,
                ),
                Overview(spaceBetween: spaceBetween, movie: movie),
                SizedBox(
                  height: spaceBetween,
                ),
                Column(
                  // bunun amacı button un stretch olmasını engellemek.
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyButton(
                      icon: SvgPicture.asset(
                        'assets/icons/play-btn-fill.svg',
                      ),
                      text: "watch_now_button_text".tr(),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Overview extends StatelessWidget {
  const Overview({
    super.key,
    required this.spaceBetween,
    required this.movie,
  });

  final double spaceBetween;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final double? overViewWidth =
        isDeviceMobile ? null : dynamicWidth(context, 0.2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.left,
          "Overview",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                letterSpacing: 0.5,
                color: myBackgroundColor,
                fontWeight: FontWeight.w400,
              ),
        ),
        SizedBox(
          height: spaceBetween / 2,
        ),
        SizedBox(
          width: overViewWidth,
          child: Text(
            textAlign: TextAlign.left,
            movie.overview!,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  letterSpacing: 0.5,
                  color: myBackgroundColor,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
      ],
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.details,
  });

  final String details;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.left,
      details,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            letterSpacing: 0.5,
            color: myBackgroundColor,
            fontWeight: FontWeight.w400,
          ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.left,
      movie.title!,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: myBackgroundColor,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
