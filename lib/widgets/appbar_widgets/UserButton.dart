import 'dart:io';

import 'package:flutter/material.dart';
import 'package:muvime/screens/profile_settings_page.dart';
import 'package:provider/provider.dart';

import '../../Datas/my_constants.dart';
import '../../providers/profileData.dart';

class UserButton extends StatefulWidget {
  const UserButton({
    super.key,
    required this.width,
  });
  final double width;

  @override
  State<UserButton> createState() => UserButtonState();
}

class UserButtonState extends State<UserButton> {
  File? profilePhoto;

  @override
  Widget build(BuildContext context) {
    void updateData(File newPhoto) {
      Provider.of<ProfileProvider>(context, listen: false)
          .changeProfilePhoto(newPhoto);
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (context) => ProfileProvider(),
              child: ProfileSettingsPage(
                changeUserButton: updateData,
              ),
            ),
          ),
        );
      },
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          border: Border.all(color: myIconsColor, width: 2),
          shape: BoxShape.circle,
          color: myBackgroundColor,
          image: Provider.of<ProfileProvider>(context).profile.photo != null
              ? DecorationImage(
                  image: FileImage(
                      Provider.of<ProfileProvider>(context).profile.photo!),
                  fit: BoxFit.fitWidth,
                  filterQuality: FilterQuality.high,
                )
              : const DecorationImage(
                  image: AssetImage('assets/profile_photo.png'),
                  fit: BoxFit.fitWidth,
                  filterQuality: FilterQuality.high,
                ),
        ),
      ),
    );
  }
}
