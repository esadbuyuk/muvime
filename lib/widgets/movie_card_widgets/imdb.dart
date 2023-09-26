import 'package:flutter/material.dart';

import '../../Datas/my_constants.dart';
import '../../functions/dynamic_size_calculator.dart';

class Imdb extends StatelessWidget {
  const Imdb({
    super.key,
    required this.imdb,
  });
  final String imdb;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      // height: dynamicHeight(context, 0.03),
      // width: dynamicWidth(context, 0.09),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: myIconsColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(dynamicHeight(context, 0.005)),
        child: Text(
          textAlign: TextAlign.center,
          imdb,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: myTextColor,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
