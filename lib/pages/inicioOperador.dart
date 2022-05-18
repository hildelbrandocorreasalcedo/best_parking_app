import 'package:best_parking_app/pages/perfil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/mensajero.dart';
import '../peticiones/peticioneshttp.dart';
import 'adicionar.dart';
import 'lista.dart';

class inicioOperador extends StatefulWidget {
  final title;
  inicioOperador({Key? key, required this.title}) : super(key: key);
  @override
  State<inicioOperador> createState() => _inicioOperadorState();
}

class _inicioOperadorState extends State<inicioOperador> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('inicio Operador'),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Botones(
            titulo: "Ingreso de vehiculos",
            ruta: "/modelos",
          ),
          SizedBox(
            height: 20,
          ),
          Botones(titulo: "Salida de vehiculos", ruta: "/modelos"),
          SizedBox(
            height: 20,
          ),
          Botones(titulo: "Consulta de vehiculos", ruta: "/modelos"),
          SizedBox(
            height: 20,
          ),
          Botones(titulo: "Consulta financiera", ruta: "/modelos"),
          SizedBox(
            height: 20,
          )
        ],
      )),
    );
  }
}

class Botones extends StatelessWidget {
  final titulo;
  final ruta;
  const Botones({Key? key, this.titulo, this.ruta}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ListaMensajeros()))
            },
        child: Text(this.titulo));
  }
}
