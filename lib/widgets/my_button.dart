import 'package:flutter/material.dart';

import '../Datas/my_constants.dart';
import '../functions/dynamic_size_calculator.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      this.miniButton = false,
      this.icon,
      this.text,
      this.color = myButtonColor});

  final bool miniButton;
  final Widget? icon;
  final String? text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    double miniButtonSize = dynamicHeight(context, 0.035);
    double normalButtonSize = dynamicHeight(context, 0.050);
    double sidePaddings = 15;
    double horizontalPaddings = dynamicHeight(context, 0.003);

    return Container(
      height: miniButton ? miniButtonSize : normalButtonSize,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(3),
          ),
          color: color),
      child: Padding(
        padding: EdgeInsets.only(
          left: sidePaddings,
          right: sidePaddings,
          top: horizontalPaddings,
          bottom: horizontalPaddings,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              FittedBox(
                  fit: BoxFit.fitHeight,
                  child: SizedBox(
                      width: miniButtonSize * 0.6,
                      height: miniButtonSize * 0.6,
                      child: icon)),
            if (text != null)
              Row(
                children: [
                  SizedBox(
                    width: sidePaddings,
                  ),
                  Text(
                    text!,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: myBackgroundColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
