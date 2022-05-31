import 'dart:convert';
import 'package:best_parking_app/models/usuario.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

void validarUsuario(
  String usuario,
  String clave,
) async {
  var url = Uri.parse(
      "https://bestparkingapp.000webhostapp.com/API/login/validar.php");

  await http.post(url, body: {
    'usuario': usuario,
    'clave': clave,
  });
}

Future<List<Usuario>> validarUsuarios(
    http.Client client, String usuario, String clave) async {
  var url = Uri.parse(
      "https://bestparkingapp.000webhostapp.com/API/login/validar.php");

  final response = await http.post(url, body: {
    'usuario': usuario,
    'clave': clave,
  });

  // Usa la función compute para ejecutar parsePhotos en un isolate separado
  return compute(pasaraListas2, response.body);
}

// Una función que convierte el body de la respuesta en un List<Photo>
List<Usuario> pasaraListas2(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Usuario>((json) => Usuario.fromJson(json)).toList();
}
