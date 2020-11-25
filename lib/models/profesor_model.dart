class Profesores {
  List<Profesor> items = new List();

  Profesores();

  Profesores.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final profesor = new Profesor.fromJsonMap(item);
      items.add(profesor);
    }
  }
}

class Profesor {
  String nombre;
  String correo;
  String telefono;
  String horario;

  Profesor({this.nombre, this.correo, this.telefono, this.horario});

  Profesor.fromJsonMap(Map<String, dynamic> json) {
    nombre = json['nombre'];
    correo = json['correo'];
    telefono = json['telefono'];
    horario = json['horario'];
  }
}
