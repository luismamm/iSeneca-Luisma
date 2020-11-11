import 'package:flutter/material.dart';

import 'package:seneca/src/pages/cuenta_page.dart';
import 'package:seneca/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iSéneca',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'cuenta': (BuildContext context) => CuentaPage()
      },
    );
  }
}
