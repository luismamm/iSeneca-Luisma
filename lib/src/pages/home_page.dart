import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
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
            _boton(),
            Divider(),
            _noRecuerdoContrasena(),
          ],
        ),
      ),
    );
  }

  Widget _introducirCorreo() {
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
        signInWithGoogle().whenComplete(() {
          Navigator.pushNamed(context, 'home2_page');
        });
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

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
  }
}
