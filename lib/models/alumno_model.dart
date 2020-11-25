class Alumnos {
  List<Alumno> items = new List();

  Alumnos();

  Alumnos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final alumno = new Alumno.fromJsonMap(item);
      items.add(alumno);
    }
  }
}

class Alumno {
  String nombre;
  String curso;

  Alumno({this.nombre, this.curso});

  Alumno.fromJsonMap(Map<String, dynamic> json) {
    nombre = json['nombre'];
    curso = json['curso'];
  }
}
