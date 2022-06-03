import 'package:flutter/material.dart';

import '../models/parqueo.dart';
import '../models/vehiculo.dart';
import '../peticiones/peticioneshttp.dart';
import 'editar.dart';
import 'lista.dart';
import 'retirarVehiculo.dart';

//--------------parqueo

var contextoppal;

class Perfilparqueo extends StatelessWidget {
  final idperfil;
  final List<Parqueo> perfil;
  Perfilparqueo({required this.perfil, this.idperfil});

  @override
  Widget build(BuildContext context) {
    contextoppal = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfl Parqueo"),
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              "Datos de parqueo",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(35, 10, 35, 0),
            height: 690,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 20,
                    left: (MediaQuery.of(context).size.width / 2) - 135,
                    child: Container(
                      //
                      height: 60,
                      width: 200,
                      child: Card(
                        elevation: 2,
                        color: Colors.blue[200],
                        child: Center(
                          child: Text(
                            perfil[idperfil].placa,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Column(
                            children: [
                              Text(
                                'Tipo de vehiculo:\n' + perfil[idperfil].tipo,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                '\nMarca del vehiculo:\n' +
                                    perfil[idperfil].marca,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                '\nFecha de entrada:\n' +
                                    perfil[idperfil]
                                        .hora_entrada
                                        .substring(0, 10),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Hora de entrada:\n' +
                                    perfil[idperfil]
                                        .hora_entrada
                                        .substring(11, 16),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                perfil[idperfil].hora_salida.toString() != ''
                                    ? '\nFecha de salida:\n' +
                                        perfil[idperfil]
                                            .hora_salida
                                            .substring(0, 10)
                                    : '\nFecha de salida:\n',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                perfil[idperfil].hora_salida.toString() != ''
                                    ? 'Hora de salida:\n' +
                                        perfil[idperfil]
                                            .hora_salida
                                            .substring(11, 16)
                                    : 'Hora de salida:\n',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                perfil[idperfil].numerohoras.toString() != ''
                                    ? '\nNumero de horas:\n' +
                                        perfil[idperfil].numerohoras
                                    : '',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                '\nTarifa por hora:\n' +
                                    perfil[idperfil].valorhora,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                perfil[idperfil].totalpagar.toString() != ''
                                    ? '\nTotal a pagar:\n' +
                                        perfil[idperfil].totalpagar
                                    : '',
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                '\nEstado:\n' + perfil[idperfil].estado,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
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
        ],
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
