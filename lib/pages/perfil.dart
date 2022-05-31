import 'package:flutter/material.dart';

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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perfil Parqueo'),
          actions: [
            IconButton(
                tooltip: 'Editar parqueo',
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ModificarParqueo(
                              perfil: perfil, idperfil: idperfil)));
                }),
            IconButton(
                tooltip: 'Eliminar Parqueo',
                icon: Icon(Icons.delete),
                onPressed: () {
                  confirmaeliminar(context, perfil[idperfil].id_parqueo);
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
                        //child: Image.network(perfil[idperfil].foto),
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
                                'Tipo: ' + perfil[idperfil].tipo,
                                style: TextStyle(fontSize: 20),
                              ),
                              Text('Marca: ' + perfil[idperfil].marca),
                              Text(
                                'Hora Entrada: ' +
                                    perfil[idperfil].hora_entrada,
                                style: TextStyle(fontSize: 20),
                              ),
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

void confirmaeliminar(context, id_parqueo) {
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
              eliminarParqueo(id_parqueo);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListaParqueos(),
                  ));
            },
          ),
        ],
      );
    },
  );
}
