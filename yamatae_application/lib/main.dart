import 'dart:io';

import 'package:flutter/material.dart';
import 'pages/login.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yamatae Coffee Shop',
      theme:
          (ThemeData(fontFamily: 'Kotta One', primaryColor: Color(0xFFEDE1D7))),
      home: LoginPage(),
    );
  }
}
