import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muvime/Datas/my_constants.dart';
import 'package:muvime/functions/dynamic_size_calculator.dart';

import 'futureMovieList.dart';
import 'my_button.dart';

class MySearchBar extends StatefulWidget {
  final Function(String)
      onQueryChanged; // search ınput değiştiğinde HomePage tarafından çağrılacak fonksiyonu parametre olarak alıyorum

  const MySearchBar({super.key, required this.onQueryChanged});

  @override
  MySearchBarState createState() => MySearchBarState();
}

class MySearchBarState extends State<MySearchBar> {
  late Widget filteredMovies = Container();

  void filterItems(String query) {
    setState(() {
      filteredMovies = FutureMovieList(
        moviesDataUrl:
            "https://api.themoviedb.org/3/search/movie?api_key=05e01dec53bdadc4c845c8c830404d00&query=$query",
      );
      widget.onQueryChanged(
          query); // HomePage' e search ınput'un değiştiğini haber veriyorum.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dynamicHeight(context, 0.06),
      width: dynamicWidth(context, 0.6),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(3),
        ),
        color: myBackgroundColor.withOpacity(0.8),
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) => filterItems(value),
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Klavyeyi kapat
                FocusScope.of(context).unfocus();
              },
              child: MyButton(
                miniButton: true,
                icon: SvgPicture.asset(
                  'assets/icons/search.svg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
