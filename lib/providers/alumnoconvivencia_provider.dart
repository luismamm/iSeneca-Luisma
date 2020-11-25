import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seneca/models/alumno_model.dart';

class AlumnoConvivenciaProvider {
  Future<List<Alumno>> getAlumnos() async {
    final url =
        'https://script.google.com/macros/s/AKfycbzfDWTAvhgHV-pY9DmePeOBeT9mR72mxYR1Rbuug73dFDyr4n-n/exec?spreadsheetId=1FeX1F4rpT4c73yqH5Oew_jlgZO0qkmW7cksBnJUmKGM&sheet=alumnosconvivencia';

    final resp = await http.get(url);

    final decodedData = json.decode(resp.body);

    final alumnos = new Alumnos.fromJsonList(decodedData);

    return alumnos.items;
  }
}

final alumnosConvivenciaProvider = AlumnoConvivenciaProvider();
