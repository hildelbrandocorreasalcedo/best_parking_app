import 'package:flutter/material.dart';

import '../models/mensajero.dart';
import '../models/parqueo.dart';
import '../models/vehiculo.dart';
import '../peticiones/peticioneshttp.dart';
import 'editar.dart';
import 'lista.dart';

//--------------parqueo

var contextoppal;

class Perfilparqueo extends StatelessWidget {
  final idperfil;
  final List<Parqueo> perfil;
  Perfilparqueo({required this.perfil, this.idperfil});

  @override
  Widget build(BuildContext context) {
    contextoppal = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perfil Parqueo'),
          actions: [
            IconButton(
                tooltip: 'Editar parqueo',
                icon: Icon(Icons.edit),
                onPressed: () {
                  // Navigator.push(
                  //context,
                  //MaterialPageRoute(
                  //builder: (BuildContext context) => ModificarMensajero(
                  // perfil: perfil, idperfil: idperfil)));
                }),
            IconButton(
                tooltip: 'Eliminar Parqueo',
                icon: Icon(Icons.delete),
                onPressed: () {
                  //confirmaeliminar(context, perfil[idperfil].id);
                })
          ],
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            height: 460,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    left: (MediaQuery.of(context).size.width / 2) - 55,
                    child: Container(
                      height: 100,
                      width: 100,
                      //color: Colors.blue,
                      child: Card(
                        elevation: 2,
                        child: Image.network(perfil[idperfil].foto_vehiculo),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              Text(
                                perfil[idperfil].tipo,
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(perfil[idperfil].marca),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Descripcion:'),
                              Text('Parqueadero las 24 Horas'),
                              SizedBox(height: 20),
                              SizedBox(height: 20),
                              Text('Verificar Placa:'),
                              SizedBox(height: 10),
                              Container(
                                width: 100,
                                height: 50,
                                color: Colors.yellowAccent,
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                child: Text(
                                  perfil[idperfil].placa,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Regresar'))
        ]),
      ),
    );
  }
}



/*
//------------mensajero

var contextoppal;

class Perfilmensajero extends StatelessWidget {
  final idperfil;
  final List<Mensajero> perfil;
  Perfilmensajero({required this.perfil, this.idperfil});

  @override
  Widget build(BuildContext context) {
    contextoppal = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Perfil',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perfil Mensajero'),
          actions: [
            IconButton(
                tooltip: 'Editar Mensajero',
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ModificarMensajero(
                              perfil: perfil, idperfil: idperfil)));
                }),
            IconButton(
                tooltip: 'Eliminar Mensajero',
                icon: Icon(Icons.delete),
                onPressed: () {
                  confirmaeliminar(context, perfil[idperfil].id);
                })
          ],
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            height: 460,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    left: (MediaQuery.of(context).size.width / 2) - 55,
                    child: Container(
                      height: 100,
                      width: 100,
                      //color: Colors.blue,
                      child: Card(
                        elevation: 2,
                        child: Image.network(perfil[idperfil].foto),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              Text(
                                perfil[idperfil].nombre,
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(perfil[idperfil].moto),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Calificaciones'),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('SOAT'),
                                      CircleAvatar(
                                        child: Text(perfil[idperfil].soat),
                                        backgroundColor:
                                            perfil[idperfil].soat == 'NO'
                                                ? Colors.red
                                                : Colors.green,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('TECNOMECANICA'),
                                      CircleAvatar(
                                        child: Text(perfil[idperfil].tecno),
                                        backgroundColor:
                                            perfil[idperfil].tecno == 'NO'
                                                ? Colors.red
                                                : Colors.green,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('ACTIVO'),
                                      CircleAvatar(
                                        child: Text(perfil[idperfil].activo),
                                        backgroundColor:
                                            perfil[idperfil].activo == 'NO'
                                                ? Colors.red
                                                : Colors.green,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Descripcion:'),
                              Text('Parqueadero las 24 Horas'),
                              SizedBox(height: 20),
                              SizedBox(height: 20),
                              Text('Verificar Placa:'),
                              SizedBox(height: 10),
                              Container(
                                width: 100,
                                height: 50,
                                color: Colors.yellowAccent,
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                child: Text(
                                  perfil[idperfil].placa,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Regresar'))
        ]),
      ),
    );
  }
}

void confirmaeliminar(context, ideliminar) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text('Realmente Desea Eliminar?'),
        actions: <Widget>[
          ElevatedButton(
            child: Icon(Icons.cancel),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            ),
            child: Icon(Icons.check_circle),
            onPressed: () {
              eliminarMensajero(ideliminar);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListaMensajeros(),
                    //builder: (context) => ListaMensajeros(title: 'Lista Mensajeros'),
                  ));
            },
          ),
        ],
      );
    },
  );
}

*/