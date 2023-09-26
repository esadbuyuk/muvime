import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Datas/my_constants.dart';
import '../functions/dynamic_size_calculator.dart';

class SubFooter extends StatelessWidget {
  const SubFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dynamicWidth(context, 1),
      color: myBackgroundColor,
      height: dynamicHeight(context, 0.3),
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: dynamicWidth(context, 0.08),
          top: 10,
          end: dynamicWidth(context, 0.08),
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 6,
            ),
            const Expanded(
              flex: 9,
              child: Logo(),
            ),
            Expanded(
              flex: 10,
              child: FittedBox(
                child: Text(
                  "© 2021 Tübitak. All rights reserved.",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: myTitleLargeColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            const Spacer(
              flex: 6,
            ),
            const Expanded(
              flex: 10,
              child: SocialMediaIcons(),
            ),
            const Spacer(
              flex: 6,
            ),
            const InformationLink(linkText: "Terms of Use"),
            const Spacer(
              flex: 2,
            ),
            const InformationLink(linkText: "API Terms of Use"),
            const Spacer(
              flex: 2,
            ),
            const InformationLink(linkText: "Privacy Policy"),
            const Spacer(
              flex: 6,
            ),
          ],
        ),
      ),
    );
  }
}

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double spaceBetween = dynamicWidth(context, 0.02);
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/fa-brands_facebook-square.svg',
        ),
        SizedBox(width: spaceBetween),
        SvgPicture.asset(
          'assets/icons/fa-brands_instagram.svg',
        ),
        SizedBox(width: spaceBetween),
        SvgPicture.asset(
          'assets/icons/fa-brands_twitter.svg',
        ),
        SizedBox(width: spaceBetween),
        SvgPicture.asset(
          'assets/icons/fa-brands_youtube.svg',
        ),
      ],
    );
  }
}

class InformationLink extends StatelessWidget {
  const InformationLink({
    super.key,
    required this.linkText,
  });

  final String linkText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: FittedBox(
        child: Text(
          linkText,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: myIconsColor,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dynamicHeight(context, 0.03),
      child: FittedBox(
        child: Text(
          'MUVIME',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: myIconsColor,
                fontWeight: FontWeight.w800,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
