import 'package:flutter/material.dart';
import 'package:seneca/providers/profesor_provider.dart';

class PersonalCentro extends StatelessWidget {
  const PersonalCentro({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Centro'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: profesorProvider.getProfesores(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(children: _elementos(snapshot.data, context));
      },
    );
  }

  List<Widget> _elementos(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((profesores) {
      final List text = [];
      text.add(profesores.nombre);
      text.add(profesores.correo);
      text.add(profesores.telefono);
      text.add(profesores.horario);
      final elemento = ListTile(
        title: Text(profesores.nombre),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, 'datos_profesores', arguments: text);
        },
      );

      opciones..add(elemento)..add(Divider());
    });

    return opciones;
  }
}
