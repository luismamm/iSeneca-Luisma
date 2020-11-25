import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:seneca/models/usuario_model.dart';

class UsuarioProvider {
  Future<List<Usuario>> getUsuarios() async {
    final url =
        'https://script.google.com/macros/s/AKfycbzfDWTAvhgHV-pY9DmePeOBeT9mR72mxYR1Rbuug73dFDyr4n-n/exec?spreadsheetId=1FeX1F4rpT4c73yqH5Oew_jlgZO0qkmW7cksBnJUmKGM&sheet=usuarios';

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    final users = new Usuarios.fromJsonList(decodedData);

    return users.items;
  }
}

final usuarioProvider = UsuarioProvider();
