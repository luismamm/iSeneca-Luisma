import 'package:flutter/material.dart';
import 'package:seneca/src/pages/alumnado_centro_page.dart';
import 'package:seneca/src/pages/alumnado_convivencia_page.dart';
import 'package:seneca/src/pages/alumnado_expulsado_page.dart';

import 'package:seneca/src/pages/cuenta_page.dart';
import 'package:seneca/src/pages/datos_profesores_page.dart';
import 'package:seneca/src/pages/home2_page.dart';
import 'package:seneca/src/pages/home_page(2).dart';
import 'package:seneca/src/pages/home_page.dart';
import 'package:seneca/src/pages/personal_centro_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iSéneca',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage2(),
        'cuenta': (BuildContext context) => CuentaPage(),
        'personal_centro': (BuildContext context) => PersonalCentro(),
        'datos_profesores': (BuildContext context) => DatosProfesores(),
        'alumnado_centro': (BuildContext context) => AlumnadoCentro(),
        'datos_alumnado_convivencia': (BuildContext context) =>
            AlumnadoConvivencia(),
        'datos_alumnado_expulsado': (BuildContext context) =>
            AlumnadoExpulsado(),
        'home2_page': (BuildContext context) => Home2Page(),
      },
    );
  }
}
