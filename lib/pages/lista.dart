import 'package:best_parking_app/pages/perfil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/parqueo.dart';
import '../models/vehiculo.dart';
import '../peticiones/peticioneshttp.dart';
import 'adicionar.dart';
import 'inicioOperador.dart';

//---------parqueo

class ListaParqueos extends StatefulWidget {
  const ListaParqueos({Key? key}) : super(key: key);

  @override
  State<ListaParqueos> createState() => _ListaParqueosState();
}

class _ListaParqueosState extends State<ListaParqueos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'LISTADO DE PARQUEOS',
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
                    icon: const Icon(Icons.home),
                    color: Colors.white,
                    tooltip: 'Inicio',
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  inicioOperador(title: 'Usuarios'),
                            ));
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
      body: getInfo1(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getInfo1(context);
          });
        },
        child: Icon(Icons.update),
      ),
    );
  }
}

Widget getInfo1(BuildContext context) {
  return FutureBuilder(
      future: listaParqueos(http.Client()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();

          case ConnectionState.done:
            return snapshot.data != null
                ? VistaParqueos(parqueos: snapshot.data)
                : Text('No hay Datos');

          default:
            return Text('Recargar los datos');
        }
      });
}

class VistaParqueos extends StatelessWidget {
  final List<Parqueo> parqueos;
  const VistaParqueos({Key? key, required this.parqueos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(20.0),
        shrinkWrap: true,
        itemCount: parqueos.length,
        itemBuilder: (context, posicion) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 2, color: Colors.cyan)
                  /*boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 8.0,
                    )
                  ]*/
                  ),
              height: 80.0,
              child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Perfilparqueo(
                                  perfil: parqueos,
                                  idperfil: posicion,
                                )));
                  },
                  leading: Container(
                    padding: EdgeInsets.all(5),
                    width: 50,
                    height: 50,
                    child: Icon(parqueos[posicion].tipo == "CARRO"
                        ? Icons.car_repair
                        : Icons.motorcycle_outlined),
                  ),
                  title: Text(
                    parqueos[posicion].placa,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  subtitle: Text(
                    parqueos[posicion].tipo,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Container(
                    width: 20,
                    /*color: Colors.yellow,*/
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: parqueos[posicion].estado == 'ACTIVO'
                              ? Colors.green
                              : Colors.red,
                        ),
                      ],
                    ),
                  )),
            ),
          );
        });
  }
}
