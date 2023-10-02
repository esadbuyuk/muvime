import 'package:flutter/material.dart';
import 'package:muvime/Datas/my_constants.dart';
import 'package:muvime/functions/dynamic_size_calculator.dart';
import 'package:provider/provider.dart';

import '../providers/profileData.dart';
import '../widgets/subFooter.dart';
import 'home_page.dart';

class ProfileLoginPage extends StatefulWidget {
  @override
  _ProfileLoginPageState createState() => _ProfileLoginPageState();
}

class _ProfileLoginPageState extends State<ProfileLoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _login(String? username, String? password) {
    String usernameInput = _usernameController.text;
    String passwordInput = _passwordController.text;

    // Kullanıcı adı ve şifre doğrulama işlemleri burada yapılabilir.
    // Örneğin, bir veritabanı sorgusu ile kullanıcı bilgileri kontrol edilebilir.

    if (usernameInput == username && passwordInput == password) {
      // Giriş başarılıysa, ana uygulama ekranına yönlendirilebilir.
      // Navigator.pushReplacementNamed(context, '/ana_ekran');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Giriş Başarılı"),
        ),
      );
    } else {
      // Giriş başarısızsa, kullanıcıya hata mesajı gösterilebilir.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Kullanıcı adı veya şifre hatalı"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = dynamicHeight(context, 0.08);
    final double sidePaddings = dynamicWidth(context, 0.03) + 16;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: appBarHeight,
        titleSpacing: 0,
        centerTitle: true,
        title: Logo(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: dynamicHeight(context, 0.2),
            ),
            const Text(
              "Profil Girişi",
              style: TextStyle(
                color: myTitleLargeColor,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: dynamicHeight(context, 0.1),
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: "Kullanıcı Adı",
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true, // Şifre alanını gizle
              decoration: const InputDecoration(
                labelText: "Şifre",
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _login(
                    Provider.of<ProfileProvider>(context, listen: false)
                        .profile
                        .username,
                    Provider.of<ProfileProvider>(context, listen: false)
                        .profile
                        .password);
              },
              child: Text("Giriş Yap"),
            ),
          ],
        ),
      ),
    );
  }
}
