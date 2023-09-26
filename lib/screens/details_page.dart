import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:muvime/widgets/details_page_hero.dart';

import '../Datas/my_constants.dart';
import '../Datas/services/tmdb_api.dart';
import '../functions/dynamic_size_calculator.dart';
import '../models/movie.dart';
import '../widgets/appbar_widgets/MenuButton.dart';
import '../widgets/appbar_widgets/UserButton.dart';
import '../widgets/footer.dart';
import '../widgets/futureCastList.dart';
import '../widgets/futureMovieList.dart';
import '../widgets/subFooter.dart';
import '../widgets/titleOfList.dart';

class DetailsPage extends StatelessWidget {
  final Movie movie; // Parametre olarak alınacak

  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    // Hero variables -------
    final double sidePaddings = dynamicWidth(context, 0.03) + 16;
    String backdropImagePath =
        "https://image.tmdb.org/t/p/w500/${movie.backdropPath}";
    String details = "${movie.releaseDate}\n"
        "${movie.genre}\n"
        "${movie.time}";
    double spaceBetween = dynamicHeight(context, 0.03);
    double appBarHeight = dynamicHeight(context, 0.08);

    // -------
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        toolbarHeight: appBarHeight,
        title: Row(
          children: [
            SizedBox(
              width: sidePaddings,
            ),
            const Logo(),
          ],
        ),
        actions: [
          const MenuButton(),
          SizedBox(
            width: dynamicWidth(context, 0.04),
          ),
          UserButton(
            width: appBarHeight / 2,
          ),
          SizedBox(
            width: sidePaddings,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailsPageHero(
                backdropImagePath: backdropImagePath,
                sidePaddings: sidePaddings,
                movie: movie,
                details: details),
            SizedBox(
              height: spaceBetween,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: dynamicHeight(context, 0.03),
                bottom: dynamicHeight(context, 0.03),
                left: dynamicWidth(context, 0.03) +
                    16, // (isDeviceMobile ? dynamicHeight(context, 0.03) : 0),
                right: dynamicWidth(context,
                    0.03), // (isDeviceMobile ? dynamicHeight(context, 0.03) : 0),
              ),
              child: TitleOfList(titleText: "top_cast_text".tr()),
            ),
            Row(
              children: [
                if (!isDeviceMobile)
                  SizedBox(
                    width: sidePaddings,
                  ),
                Expanded(
                  child: FutureCastList(
                    castDataUrl: TmdbApi.getMovieCast(movie.id!),
                  ),
                ),
                if (!isDeviceMobile)
                  SizedBox(
                    width: sidePaddings,
                  ),
              ],
            ),
            SizedBox(
              height: spaceBetween,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: dynamicHeight(context, 0.03),
                bottom: dynamicHeight(context, 0.03),
                left: dynamicWidth(context, 0.03) +
                    16, // (isDeviceMobile ? dynamicHeight(context, 0.03) : 0),
                right: dynamicWidth(context,
                    0.03), // (isDeviceMobile ? dynamicHeight(context, 0.03) : 0),
              ),
              child: TitleOfList(titleText: "more_like_this_text".tr()),
            ),
            Row(
              children: [
                if (!isDeviceMobile)
                  SizedBox(
                    width: sidePaddings,
                  ),
                Expanded(
                  child: FutureMovieList(
                    moviesDataUrl: TmdbApi.getMoreLikeThisUrl(movie.id!),
                  ),
                ),
                if (!isDeviceMobile)
                  SizedBox(
                    width: sidePaddings,
                  ),
              ],
            ),
            SizedBox(
              height: spaceBetween,
            ),
            const Footer(),
            const SubFooter(),
          ],
        ),
      ),
    );
  }
}
