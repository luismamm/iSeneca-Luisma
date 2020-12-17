import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Home2Page extends StatefulWidget {
  Home2Page({Key key}) : super(key: key);

  @override
  _Home2PageState createState() => _Home2PageState();
}

class _Home2PageState extends State<Home2Page> {
  final Firestore firestore = Firestore.instance;

  void _create() async {
    try {
      await firestore.collection('users').document('testUser').setData({
        'firstName': 'test',
        'lastName': 'user',
      });
    } catch (e) {
      print(e);
    }
  }

  void _read() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot =
          await firestore.collection('users').document('testUser').get();
      print(documentSnapshot.data);
    } catch (e) {
      print(e);
    }
  }

  void _update() async {
    try {
      firestore.collection('users').document('testUser').updateData({
        'firstName': 'Luisma',
        'lastName': 'Merino',
      });
    } catch (e) {
      print(e);
    }
  }

  void _delete() async {
    try {
      firestore.collection('users').document('testUser').delete();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Firebase"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Create"),
                onPressed: _create,
              ),
              RaisedButton(
                child: Text("Read"),
                onPressed: _read,
              ),
              RaisedButton(
                child: Text("Update"),
                onPressed: _update,
              ),
              RaisedButton(
                child: Text("Delete"),
                onPressed: _delete,
              ),
            ]),
      ),
    );
  }
}
