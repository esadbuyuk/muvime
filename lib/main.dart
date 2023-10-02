import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muvime/providers/profileData.dart';
import 'package:muvime/screens/login_page.dart';
import 'package:provider/provider.dart';

import 'Datas/my_constants.dart';

bool isMyDeviceMobile(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  // Dikey uzunluk yatay uzunluktan büyükse, cihaz mobil kabul edilir.
  return screenHeight > screenWidth;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("en", "US"), Locale("tr", "TR")],
      path: 'assets/translations',
      fallbackLocale: const Locale("tr", "TR"),
      child: ChangeNotifierProvider<ProfileProvider>(
        create: (BuildContext context) => ProfileProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    isDeviceMobile = isMyDeviceMobile(context);

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: const Locale("tr", "TR"), //context.deviceLocale,

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: myBackgroundColor,
        primaryColor: myPrimaryColor,
        appBarTheme: const AppBarTheme(color: Colors.white),
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: ProfileLoginPage(),
    );
  }
}
