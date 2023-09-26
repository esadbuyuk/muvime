import 'package:flutter/material.dart';

import '../../Datas/my_constants.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.left,
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: myTitleLargeColor,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
