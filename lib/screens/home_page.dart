import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Datas/my_constants.dart';
import '../Datas/services/tmdb_api.dart';
import '../functions/dynamic_size_calculator.dart';
import '../widgets/appbar_widgets/MenuButton.dart';
import '../widgets/appbar_widgets/UserButton.dart';
import '../widgets/footer.dart';
import '../widgets/futureMovieList.dart';
import '../widgets/my_button.dart';
import '../widgets/searchBar.dart';
import '../widgets/subFooter.dart';
import '../widgets/titleOfList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String _query = ""; // SearchBar ınput
bool activateHomeView = true;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double appBarHeight = dynamicHeight(context, 0.08);
    // Hero variables -------
    String overview =
        "John Wick is on the run after killing a member of the international assassins' guild, and with a \$14 million price tag on his head, he is the target of hit men and women everywhere.";
    String title = "John Wick 3";
    // -------

    final double spaceBetween = dynamicHeight(context, 0.005);

    final double sidePaddings = dynamicWidth(context, 0.03) + 16;

    void activateResultView() {
      activateHomeView = false;
    }

    void activateMyHomeView() {
      activateHomeView = true;
    }

    void updateQuery(String newInput) {
      setState(() {
        _query = newInput; // Değişkeni güncelle
        if (newInput == "") {
          activateMyHomeView();
        } else {
          activateResultView();
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: appBarHeight,
        titleSpacing: 0,
        title: Row(
          children: [
            SizedBox(
              width: sidePaddings,
            ),
            const Logo(),
          ],
        ),
        actions: [
          if (isDeviceMobile) const MenuButton(),
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
      body: Container(
        constraints: BoxConstraints(maxWidth: dynamicWidth(context, 1)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // Hero
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/background.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.darken),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(sidePaddings),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MySearchBar(onQueryChanged: updateQuery),
                      if (activateHomeView) ...[
                        HeroDescriptionBox(title: title, overview: overview),
                      ],
                    ],
                  ),
                ),
              ), // -------> hero
              if (activateHomeView) ...[
                Padding(
                  padding: EdgeInsets.only(
                    top: dynamicHeight(context, 0.03),
                    bottom: dynamicHeight(context, 0.03),
                    left: dynamicWidth(context, 0.03) +
                        16, // (isDeviceMobile ? dynamicHeight(context, 0.03) : 0),
                    right: dynamicWidth(context,
                        0.03), // (isDeviceMobile ? dynamicHeight(context, 0.03) : 0),
                  ),
                  child: const TitleOfList(
                      titleText: "title_of_popular_movie_list"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: isDeviceMobile ? 0 : sidePaddings,
                    right: isDeviceMobile ? 0 : sidePaddings,
                  ),
                  child: FutureMovieList(
                    moviesDataUrl: TmdbApi.getPopularMoviesUrl(),
                  ),
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
                  child:
                      const TitleOfList(titleText: "title_of_free_movie_list"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: isDeviceMobile ? 0 : sidePaddings,
                    right: isDeviceMobile ? 0 : sidePaddings,
                  ),
                  child: FutureMovieList(
                    moviesDataUrl: TmdbApi.getFreeMoviesUrl(),
                  ),
                ),
              ],
              if (!activateHomeView) ...[
                Padding(
                  padding: EdgeInsets.only(
                    top: dynamicHeight(context, 0.03),
                    bottom: dynamicHeight(context, 0.03),
                    left: dynamicWidth(context, 0.03) +
                        16, // (isDeviceMobile ? dynamicHeight(context, 0.03) : 0),
                    right: dynamicWidth(context,
                        0.03), // (isDeviceMobile ? dynamicHeight(context, 0.03) : 0),
                  ),
                  child: const TitleOfList(titleText: "Search Result"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: isDeviceMobile ? 0 : sidePaddings,
                    right: isDeviceMobile ? 0 : sidePaddings,
                  ),
                  child: FutureMovieList(
                    moviesDataUrl: TmdbApi.getSearchResultUrl() + _query,
                  ),
                ),
              ],
              SizedBox(
                height: spaceBetween,
              ),
              const Footer(),
              const SubFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroDescriptionBox extends StatelessWidget {
  const HeroDescriptionBox({
    super.key,
    required this.title,
    required this.overview,
  });

  final String title;
  final String overview;

  @override
  Widget build(BuildContext context) {
    final double spaceBetween = dynamicHeight(context, 0.03);
    final double? overViewWidth =
        isDeviceMobile ? null : dynamicWidth(context, 0.2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: spaceBetween,
        ),
        Text(
          textAlign: TextAlign.left,
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: myBackgroundColor,
                fontWeight: FontWeight.w600,
              ),
        ),
        SizedBox(
          height: spaceBetween,
        ),
        SizedBox(
          width: overViewWidth,
          child: Text(
            textAlign: TextAlign.left,
            overview,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  letterSpacing: 0.5,
                  color: myBackgroundColor,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ),
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
              text: "watch_trial_button_text".tr(),
            ),
          ],
        )
      ],
    );
  }
}
