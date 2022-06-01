import 'package:best_parking_app/pages/perfil.dart';
import 'package:best_parking_app/pages/salidavehiculo.dart';
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
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),
            toolbarHeight: 90,
            backgroundColor: Colors.blue.shade400,
            elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7, spreadRadius: 3, color: Colors.pink)
                    ], shape: BoxShape.circle, color: Colors.pink.shade400),
                    child: IconButton(
                      icon: const Icon(Icons.output_outlined),
                      color: Colors.white,
                      tooltip: 'Log-Out',
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              ),
            ]),
        //drawer: Drawer(),
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
                        'ENTRADA DE VEHICULOS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      salidaVehiculo()));
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        'SALIDA DE VEHICULOS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
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
                        'CONSULTAR PARQUEOS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
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
                        'CONSULTA FINANCIERA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
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
