import 'package:flutter/material.dart';

double dynamicHeight(BuildContext context, double percentage) {
  double screenHeight = MediaQuery.of(context).size.height;
  return screenHeight * percentage;
}

double dynamicWidth(BuildContext context, double percentage) {
  double screenWidth = MediaQuery.of(context).size.width;
  return screenWidth * percentage;
}
