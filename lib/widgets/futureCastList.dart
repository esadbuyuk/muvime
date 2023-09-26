import 'package:flutter/material.dart';
import 'package:muvime/Datas/my_constants.dart';

import '../Datas/services/castListData.dart';
import '../functions/dynamic_size_calculator.dart';
import '../models/cast.dart';
import 'cast_card.dart';

class FutureCastList extends StatefulWidget {
  const FutureCastList({
    super.key,
    required this.castDataUrl,
  });

  final String castDataUrl;

  @override
  State<FutureCastList> createState() => _FutureCastListState();
}

class _FutureCastListState extends State<FutureCastList> {
  late Future<List<Cast>>? _futureCastList;

  @override
  void initState() {
    super.initState();
    _futureCastList = callFutureCastList(widget.castDataUrl);
  }

  // Widget çağırıldığında çalışır.
  void changeMovieList() {
    super.didChangeDependencies();
    setState(() {
      _futureCastList = callFutureCastList(widget.castDataUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    changeMovieList();

    return FutureBuilder<List<Cast>>(
      future: _futureCastList,
      builder: (BuildContext context, AsyncSnapshot<List<Cast>> snapshot) {
        if (snapshot.hasData) {
          List<Cast> myList = snapshot.data!;
          return CastList(myList: myList);
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("couldnt get data."),
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

class CastList extends StatelessWidget {
  const CastList({
    super.key,
    required List<Cast> myList,
  }) : _myList = myList;

  final List<Cast> _myList;

  @override
  Widget build(BuildContext context) {
    double sidePaddings = dynamicWidth(context, 0.03) + 16;

    return SizedBox(
      height: dynamicHeight(context, 0.12),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        addAutomaticKeepAlives: false,
        itemCount: castPerList,
        itemBuilder: (context, index) => CastCard(
          cast: _myList[index],
        ),
        padding: EdgeInsets.only(
          left: isDeviceMobile ? sidePaddings : 0,
          right: isDeviceMobile ? sidePaddings : 0,
        ),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 20,
          );
        },
      ),
    );
  }
}
