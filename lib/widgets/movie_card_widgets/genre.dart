import 'package:flutter/material.dart';

import '../../Datas/my_constants.dart';

class Genre extends StatelessWidget {
  const Genre({
    super.key,
    required this.genre,
  });
  final String genre;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.left,
      genre,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: myBodyLargeColor,
            fontWeight: FontWeight.w800,
          ),
    );
  }
}
