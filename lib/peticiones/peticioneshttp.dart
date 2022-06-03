import 'dart:convert';
import 'package:best_parking_app/models/parqueo.dart';
import 'package:best_parking_app/models/vehiculo.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

//----------Parqueo

Future<List<Parqueo>> listaParqueos(http.Client client) async {
  //final response =
  //    await client.get('https://desarolloweb2021a.000webhostapp.com/API/listarnotas.php');
  //var id = "2";
  final response = await client.get(Uri.parse(
      'https://bestparkingapp.000webhostapp.com/API/parqueovehiculo/listar.php'));

  // Usa la función compute para ejecutar parsePhotos en un isolate separado
  return compute(pasaraListas, response.body);
}

Future<List<Parqueo>> listaParqueosActivos(http.Client client) async {
  //final response =
  //    await client.get('https://desarolloweb2021a.000webhostapp.com/API/listarnotas.php');
  //var id = "2";
  final response = await client.get(Uri.parse(
      'https://bestparkingapp.000webhostapp.com/API/parqueovehiculo/listarActivos.php'));

  // Usa la función compute para ejecutar parsePhotos en un isolate separado
  return compute(pasaraListas, response.body);
}

// Una función que convierte el body de la respuesta en un List<Photo>
List<Parqueo> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Parqueo>((json) => Parqueo.fromJson(json)).toList();
}

void adicionarParqueo(
    String tipo,
    String placa,
    String marca,
    String hora_entrada,
    String hora_salida,
    String estado,
    String numerohoras,
    String valorhora,
    String totalpagar) async {
  var url = Uri.parse(
      "https://bestparkingapp.000webhostapp.com/API/parqueovehiculo/adicionar.php");

  await http.post(url, body: {
    'tipo': tipo,
    'placa': placa,
    'marca': marca,
    'hora_entrada': hora_entrada,
    'hora_salida': hora_salida,
    'estado': estado,
    'numerohoras': numerohoras,
    'valorhora': valorhora,
    'totalpagar': totalpagar,
  });
}

void editarParqueo(
  String id_parqueo,
  String tipo,
  String placa,
  String marca,
  String hora_entrada,
) async {
  var url = Uri.parse(
      "https://bestparkingapp.000webhostapp.com/API/parqueovehiculo/modificar.php");

  await http.post(url, body: {
    'id_parqueo': id_parqueo,
    'tipo': tipo,
    'placa': placa,
    'marca': marca,
    'hora_entrada': hora_entrada,
  });
}

void eliminarParqueo(id_parqueo) async {
  var url = Uri.parse(
      "https://bestparkingapp.000webhostapp.com/API/parqueovehiculo/eliminar.php");

  await http.post(url, body: {
    'id_parqueo': id_parqueo,
  });
}

void facturarParqueo(
    String id_parqueo,
    String tipo,
    String placa,
    String marca,
    String hora_entrada,
    String hora_salida,
    String estado,
    String numerohoras,
    String valorhora,
    String totalpagar) async {
  var url = Uri.parse(
      "https://bestparkingapp.000webhostapp.com/API/parqueovehiculo/facturar.php");

  await http.post(url, body: {
    'id_parqueo': id_parqueo,
    'tipo': tipo,
    'placa': placa,
    'marca': marca,
    'hora_entrada': hora_entrada,
    'hora_salida': hora_salida,
    'estado': estado,
    'numerohoras': numerohoras,
    'valorhora': valorhora,
    'totalpagar': totalpagar,
  });
}
