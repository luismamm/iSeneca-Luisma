class Usuarios {
  List<Usuario> items = new List();

  Usuarios();

  Usuarios.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final usuario = new Usuario.fromJsonMap(item);
      items.add(usuario);
    }
  }
}

class Usuario {
  String usuario;
  String clave;

  Usuario({this.usuario, this.clave});

  Usuario.fromJsonMap(Map<String, dynamic> json) {
    usuario = json['usuario'];
    clave = json['clave'];
  }
}
