import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../Datas/my_constants.dart';
import '../functions/dynamic_size_calculator.dart';

class TitleOfList extends StatelessWidget {
  const TitleOfList({
    super.key,
    required this.titleText,
  });

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dynamicHeight(context, 0.035),
      child: FittedBox(
        child: Text(
          titleText,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: myHeadlineSmallColor,
                fontWeight: FontWeight.w600,
              ),
        ).tr(),
      ),
    );
  }
}
