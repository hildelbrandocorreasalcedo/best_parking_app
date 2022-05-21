import 'dart:convert';
import 'package:best_parking_app/models/mensajero.dart';
import 'package:best_parking_app/models/parqueo.dart';
import 'package:best_parking_app/models/vehiculo.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

//----------Parqueo

Future<List<Parqueo>> listaParqueos(http.Client client) async {
  //final response =
  //    await client.get('https://desarolloweb2021a.000webhostapp.com/API/listarnotas.php');
  //var id = "2";
  final response = await client.get(
      Uri.parse('https://bestparkingapp.000webhostapp.com/API/listar.php'));

  // Usa la función compute para ejecutar parsePhotos en un isolate separado
  return compute(pasaraListas, response.body);
}

// Una función que convierte el body de la respuesta en un List<Photo>
List<Parqueo> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Parqueo>((json) => Parqueo.fromJson(json)).toList();
}

void adicionarParqueo(String tipo, String placa, String marca,
    String hora_entrada, String foto_vehiculo) async {
  var url =
      Uri.parse("https://bestparkingapp.000webhostapp.com/API/adicionar.php");

  await http.post(url, body: {
    'tipo': tipo,
    'placa': placa,
    'marca': marca,
    'hora_entrada': hora_entrada,
    'foto_vehiculo': foto_vehiculo,
  });
}


/*
//----------vehiculo

Future<List<Vehiculo>> listaVehiculos(http.Client client) async {
  //final response =
  //    await client.get('https://desarolloweb2021a.000webhostapp.com/API/listarnotas.php');
  //var id = "2";
  final response = await client.get(
      Uri.parse('https://bestparkingapp.000webhostapp.com/API/listar.php'));

  // Usa la función compute para ejecutar parsePhotos en un isolate separado
  return compute(pasaraListas2, response.body);
}

// Una función que convierte el body de la respuesta en un List<Photo>
List<Vehiculo> pasaraListas2(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Vehiculo>((json) => Vehiculo.fromJson(json)).toList();
}

void adicionarVehiculo(String id_vehiculo, String tipo, String placa,
    String marca, String foto_vehiculo) async {
  var url =
      Uri.parse("https://bestparkingapp.000webhostapp.com/API/adicionar.php");

  await http.post(url, body: {
    'id_vehiculo': id_vehiculo,
    'tipo': tipo,
    'placa': placa,
    'marca': marca,
    'foto_vehiculo': foto_vehiculo,
  });
}
*/









/*
//-------mensajero

Future<List<Mensajero>> listaMensajeros(http.Client client) async {
  //final response =
  //    await client.get('https://desarolloweb2021a.000webhostapp.com/API/listarnotas.php');
  //var id = "2";
  final response = await client.get(
      Uri.parse('https://bestparkingapp.000webhostapp.com/API/listar.php'));

  // Usa la función compute para ejecutar parsePhotos en un isolate separado
  return compute(pasaraListas, response.body);
}

// Una función que convierte el body de la respuesta en un List<Photo>
List<Mensajero> pasaraListas(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Mensajero>((json) => Mensajero.fromJson(json)).toList();
}

void adicionarMensajero(
    String nombre,
    String foto,
    String placa,
    String telefono,
    String whatsapp,
    String moto,
    String soat,
    String tecno,
    String activo) async {
  var url =
      Uri.parse("https://bestparkingapp.000webhostapp.com/API/adicionar.php");

  await http.post(url, body: {
    'nombre': nombre,
    'foto': foto,
    'placa': placa,
    'telefono': telefono,
    'whatsapp': whatsapp,
    'moto': moto,
    'soat': soat,
    'tecno': tecno,
    'activo': activo,
  });
}

void editarMensajero(
    String id,
    String nombre,
    String foto,
    String placa,
    String telefono,
    String whatsapp,
    String moto,
    String soat,
    String tecno,
    String activo) async {
  var url =
      Uri.parse("https://bestparkingapp.000webhostapp.com/API/modificar.php");

  await http.post(url, body: {
    'id': id,
    'nombre': nombre,
    'foto': foto,
    'placa': placa,
    'telefono': telefono,
    'whatsapp': whatsapp,
    'moto': moto,
    'soat': soat,
    'tecno': tecno,
    'activo': activo
  });
}

void eliminarMensajero(id) async {
  var url =
      Uri.parse("https://bestparkingapp.000webhostapp.com/API/eliminar.php");

  await http.post(url, body: {
    'ideliminar': id,
  });
}
*/