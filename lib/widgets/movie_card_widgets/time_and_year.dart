import 'package:flutter/material.dart';

import '../../Datas/my_constants.dart';

class TimeAndYear extends StatelessWidget {
  const TimeAndYear({
    super.key,
    required this.year,
    required this.time,
  });
  final String year;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$time / $year",
      // '2h 23m / 2021',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: myBodyLargeColor,
            fontWeight: FontWeight.w400,
          ),
    );
  }
}
