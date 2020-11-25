import 'package:flutter/material.dart';

class AlumnadoCentro extends StatelessWidget {
  const AlumnadoCentro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alumnado Centro'),
      ),
      body: _lista(context),
    );
  }

  Widget _lista(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Alumnos Convivencia'),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {
            Navigator.pushNamed(context, 'datos_alumnado_convivencia');
          },
        ),
        Divider(),
        ListTile(
          title: Text('Alumnos Expulsados'),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
          onTap: () {
            Navigator.pushNamed(context, 'datos_alumnado_expulsado');
          },
        )
      ],
    );
  }
}
