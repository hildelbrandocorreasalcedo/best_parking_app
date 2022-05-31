import 'package:best_parking_app/pages/perfil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              'GESTION DE PARQUEOS',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.blue.shade400,
            actions: [
              Center(
                child: IconButton(
                  icon: const Icon(Icons.assignment_return_outlined),
                  color: Colors.black,
                  tooltip: 'Log-Out',
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                ),
              )
            ]),
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        child: Image.asset('img/icono_ingreso.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      AgregarParqueo()));
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Entrada de vehiculos',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        child: Image.asset('img/icono_salida.png'),
                        onPressed: () {
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ListaMensajeros()));*/
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Salida de Vehiculo',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        child: Image.asset('img/icono_consulta.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ListaParqueos()));
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Consultar Vehiculos',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        child: Image.asset('img/icono_financiero.png'),
                        onPressed: () {
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ListaMensajeros()));*/
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Consulta Financiera',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
