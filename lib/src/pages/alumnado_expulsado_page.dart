import 'package:flutter/material.dart';
import 'package:seneca/providers/alumnoexpulsado.dart';

class AlumnadoExpulsado extends StatelessWidget {
  const AlumnadoExpulsado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alumnos expulsados'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: alumnosExpulsadosProvider.getAlumnos(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(children: _elementos(snapshot.data, context));
      },
    );
  }

  List<Widget> _elementos(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((alumnos) {
      final elemento = Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text('Nombre: ' + alumnos.nombre),
            Text('Curso: ' + alumnos.curso)
          ],
        ),
      );

      opciones..add(elemento)..add(Divider());
    });

    return opciones;
  }
}
