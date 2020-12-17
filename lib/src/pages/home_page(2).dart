import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class HomePage2 extends StatefulWidget {
  HomePage2({Key key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Google',
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
          ],
        ),
      ),
    );
  }

  Widget _introducirUsuario() {
    return TextField(
      controller: _controller,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.blue[200],
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: 'Correo',
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
      controller: _controller2,
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
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        handleSignInEmail(_controller.text, _controller2.text)
            .then((FirebaseUser user) {
          Navigator.pushNamed(context, 'home2_page');
        }).catchError((e) => print(e));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
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

  Future<FirebaseUser> handleSignInEmail(String email, String password) async {
    AuthResult result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    final FirebaseUser user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await auth.currentUser();
    assert(user.uid == currentUser.uid);

    print('signInEmail succeeded: $user');

    return user;
  }
}
