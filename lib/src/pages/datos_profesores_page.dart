import 'package:flutter/material.dart';

class DatosProfesores extends StatelessWidget {
  const DatosProfesores({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List text = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profesor'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text('Nombre: ' + text[0]),
            Text('Correo: ' + text[1]),
            Text('Teléfono: ' + text[2]),
            Text('Horario: ' + text[3]),
          ],
        ),
      ),
    );
  }
}
