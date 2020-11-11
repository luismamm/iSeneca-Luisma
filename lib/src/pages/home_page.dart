import 'package:flutter/material.dart';

import 'package:seneca/src/pages/cuenta_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'iSéneca',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 70.0),
            ),
            Divider(),
            _introducirUsuario(),
            Divider(),
            _introducirContrasena(),
            Divider(),
            _boton(),
            Divider(),
            _noRecuerdoContrasena(),
            Divider(),
            _imagenJuntaAndalucia()
          ],
        ),
      ),
    );
  }

  final _textController = new TextEditingController();

  Widget _introducirUsuario() {
    return TextField(
      controller: _textController,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.blue[200],
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: 'Usuario',
          hintStyle: TextStyle(color: Colors.white)),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget _introducirContrasena() {
    return TextField(
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.blue[200],
      obscureText: _obscureText,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: 'Contraseña',
        hintStyle: TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          onPressed: _toggle,
          icon: Icon(Icons.remove_red_eye, color: Colors.white),
        ),
      ),
    );
  }

  Widget _boton() {
    return FlatButton(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 140.0, vertical: 18.0),
      child: Text(
        'Entrar',
        style: TextStyle(color: Colors.blue),
      ),
      onPressed: () {
        final route = MaterialPageRoute(
            builder: (BuildContext context) =>
                CuentaPage(value: _textController.text));

        Navigator.push(context, route);
      },
    );
  }

  Widget _noRecuerdoContrasena() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 70.0),
      child: Text('No recuerdo mi contraseña',
          style: TextStyle(color: Colors.white, fontSize: 17.0)),
    );
  }

  Widget _imagenJuntaAndalucia() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 40.0),
        child: Image(image: AssetImage('assets/imagen.png')));
  }
}
