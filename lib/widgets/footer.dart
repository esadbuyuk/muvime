import 'package:flutter/material.dart';

import '../Datas/my_constants.dart';
import '../functions/dynamic_size_calculator.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double spaceBetweenInformations = 5;
    double titleSpace = dynamicHeight(context, 0.027);
    double topSpace = dynamicHeight(context, 0.045);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: dynamicHeight(context, 0.28),
        width: isDeviceMobile
            ? dynamicWidth(context, 1.7)
            : dynamicWidth(context, 1),
        color: myPrimaryColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Expanded(
              flex: 4,
              child: SizedBox(
                height: dynamicHeight(context, 0.35),
                width: dynamicWidth(context, 0.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: topSpace,
                    ),
                    const SupplementTitle(supplementTitle: 'THE BASIC'),
                    SizedBox(
                      height: titleSpace,
                    ),
                    const SupplementInformation(
                      supplementInformations: 'About TMDB',
                    ),
                    SizedBox(
                      height: spaceBetweenInformations,
                    ),
                    const SupplementInformation(
                      supplementInformations: "Contact Us",
                    ),
                    SizedBox(
                      height: spaceBetweenInformations,
                    ),
                    const SupplementInformation(
                      supplementInformations: "Support Forums",
                    ),
                    SizedBox(
                      height: spaceBetweenInformations,
                    ),
                    const SupplementInformation(
                      supplementInformations: "API",
                    ),
                    SizedBox(
                      height: spaceBetweenInformations,
                    ),
                    const SupplementInformation(
                      supplementInformations: "System Status",
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: topSpace,
                  ),
                  const SupplementTitle(supplementTitle: 'GET INVOLVED'),
                  SizedBox(
                    height: titleSpace,
                  ),
                  const SupplementInformation(
                    supplementInformations: 'Contribution Bible',
                  ),
                  SizedBox(
                    height: spaceBetweenInformations,
                  ),
                  const SupplementInformation(
                    supplementInformations: "3rd Party",
                  ),
                  SizedBox(
                    height: spaceBetweenInformations,
                  ),
                  const SupplementInformation(
                    supplementInformations: "Applications",
                  ),
                  SizedBox(
                    height: spaceBetweenInformations,
                  ),
                  const SupplementInformation(
                    supplementInformations: "Add New Movie",
                  ),
                  SizedBox(
                    height: spaceBetweenInformations,
                  ),
                  const SupplementInformation(
                    supplementInformations: "Add New TV Show",
                  ),
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: topSpace,
                  ),
                  const SupplementTitle(supplementTitle: 'THE BASIC'),
                  SizedBox(
                    height: titleSpace,
                  ),
                  const SupplementInformation(
                    supplementInformations: 'About TMDB',
                  ),
                  SizedBox(
                    height: spaceBetweenInformations,
                  ),
                  const SupplementInformation(
                    supplementInformations: "Contact Us",
                  ),
                  SizedBox(
                    height: spaceBetweenInformations,
                  ),
                  const SupplementInformation(
                    supplementInformations: "Support Forums",
                  ),
                  SizedBox(
                    height: spaceBetweenInformations,
                  ),
                  const SupplementInformation(
                    supplementInformations: "API",
                  ),
                  SizedBox(
                    height: spaceBetweenInformations,
                  ),
                  const SupplementInformation(
                    supplementInformations: "System Status",
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class SupplementInformation extends StatelessWidget {
  const SupplementInformation({
    super.key,
    required this.supplementInformations,
  });

  final String supplementInformations;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        supplementInformations,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: myTextColor,
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}

class SupplementTitle extends StatelessWidget {
  const SupplementTitle({
    super.key,
    required this.supplementTitle,
  });

  final String supplementTitle;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        textAlign: TextAlign.left,
        supplementTitle,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: myTextColor,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
