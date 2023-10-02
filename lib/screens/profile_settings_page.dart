import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:muvime/functions/dynamic_size_calculator.dart';
import 'package:muvime/widgets/my_button.dart';

import '../Datas/my_constants.dart';
import '../main.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key, required this.changeUserButton});
  final Function changeUserButton;

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  static File? _image;

  @override
  Widget build(BuildContext context) {
    Future<void> getImageFromGallery() async {
      final imagePicker = ImagePicker();
      final image = await imagePicker.pickImage(source: ImageSource.gallery);
      late File file;

      if (image != null) {
        file = File(image.path);
        // Artık "file" bir File nesnesi ve kullanabilirsiniz.
        widget.changeUserButton(file);
      } else {
        // Kullanıcı dosya seçmedi veya bir hata oluştu.
      }

      setState(() {
        _image = file;
      });
    }

    Future<void> getImageFromCamera() async {
      final imagePicker = ImagePicker();
      final image = await imagePicker.pickImage(source: ImageSource.camera);
      late File file;

      if (image != null) {
        file = File(image.path);
        // Artık "file" bir File nesnesi ve kullanabilirsiniz.
        widget.changeUserButton(file);
        // file = Provider.of<ProfileProvider>(context).profile.photo!;
      } else {
        // Kullanıcı dosya seçmedi veya bir hata oluştu.
      }

      setState(() {
        _image = file;
      });
    }

    void languageBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text('English'),
                  onTap: () {
                    void changeLanguage(
                        BuildContext context, Locale newLocale) {
                      context.setLocale(
                        newLocale,
                      );
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ),
                      );
                    }

                    changeLanguage(context, Locale("en", "US"));
                  },
                ),
                ListTile(
                  title: Text('Türkçe'),
                  onTap: () {
                    void changeLanguage(
                        BuildContext context, Locale newLocale) {
                      context.setLocale(
                        newLocale,
                      );
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ),
                      );
                    }

                    changeLanguage(context, Locale("tr", "TR"));
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    void changeImageBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('Get Image From Camera'),
                onTap: () {
                  getImageFromCamera();
                },
              ),
              ListTile(
                title: const Text('Get image From Gallery'),
                onTap: () {
                  getImageFromGallery();
                },
              ),
            ],
          );
        },
      );
    }

    Color buttonColor = myTitleLargeColor;
    return Container(
      // background
      decoration: BoxDecoration(
        color: Colors.blue,
        image: _image != null
            ? DecorationImage(
                image: FileImage(_image!),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.darken),
              )
            : DecorationImage(
                image: const AssetImage('assets/profile_photo.png'),
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.darken),
              ),
      ),
      height: dynamicHeight(context, 1),
      width: dynamicWidth(context, 1),
      child: Column(
        children: [
          SizedBox(
            height: dynamicHeight(context, 0.04),
          ),
          const CustomAppBar(),
          SizedBox(
            height: dynamicHeight(context, 0.04),
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              ProfilePhotoCircle(image: _image),
              Positioned(
                bottom: 35,
                child: GestureDetector(
                  onTap: () {
                    changeImageBottomSheet(context);
                  },
                  child: TakePhotoButton(buttonColor: buttonColor),
                ),
              ),
            ],
          ),

          SizedBox(
            height: dynamicHeight(context, 0.04),
          ),
          MyButton(
            text: "security_settings_text".tr(),
            color: buttonColor,
          ),
          SizedBox(
            height: dynamicHeight(context, 0.04),
          ),
          MyButton(
            text: "change_password_text".tr(),
            color: buttonColor,
          ), // İstediğiniz boşluk
          SizedBox(
            height: dynamicHeight(context, 0.04),
          ),

          GestureDetector(
            onTap: () {
              languageBottomSheet(context);
            },
            child: MyButton(
              text: "language_text".tr(),
              color: buttonColor,
            ),
          ),
          SizedBox(
            height: dynamicHeight(context, 0.04),
          ),
          GestureDetector(
            onTap: () {
              void changeLanguage(BuildContext context) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              }

              changeLanguage(context);
            },
            child: MyButton(
              text: "log_out_text".tr(),
              color: buttonColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSettingsItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 10.0),
        Text(text),
      ],
    );
  }
}

class TakePhotoButton extends StatelessWidget {
  const TakePhotoButton({
    super.key,
    required this.buttonColor,
  });

  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: buttonColor,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Icon(
          Icons.camera_alt_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ProfilePhotoCircle extends StatelessWidget {
  const ProfilePhotoCircle({
    super.key,
    required File? image,
  }) : _image = image;

  final File? _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dynamicWidth(context, 0.2),
      height: dynamicHeight(context, 0.2),
      decoration: BoxDecoration(
        border: Border.all(color: myIconsColor, width: 2),
        shape: BoxShape.circle,
        color: myBackgroundColor,
        image: _image != null
            ? DecorationImage(
                image: FileImage(_image!),
                fit: BoxFit.fitWidth,
                filterQuality: FilterQuality.high,
              )
            : const DecorationImage(
                image: AssetImage('assets/profile_photo.png'),
                fit: BoxFit.fitWidth,
                filterQuality: FilterQuality.high,
              ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: dynamicWidth(context, 0.04),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: dynamicWidth(context, 0.12),
        ),
        Title(text: "profile_settings_text".tr()),
      ],
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: myBackgroundColor,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
