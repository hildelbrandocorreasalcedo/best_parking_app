import 'package:best_parking_app/models/factura.dart';
import 'package:best_parking_app/pages/retirarVehiculo.dart';
import 'package:best_parking_app/pages/perfil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/parqueo.dart';
import '../models/vehiculo.dart';
import '../peticiones/peticioneshttp.dart';
import 'adicionar.dart';

//---------parqueo

class salidaVehiculo extends StatefulWidget {
  const salidaVehiculo({Key? key}) : super(key: key);

  @override
  State<salidaVehiculo> createState() => _salidaVehiculoState();
}

class _salidaVehiculoState extends State<salidaVehiculo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      future: listaParqueosActivos(http.Client()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());

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
        //padding: EdgeInsets.all(5.0),
        shrinkWrap: true,
        itemCount: parqueos.length,
        itemBuilder: (context, posicion) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
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
              height: 50.0,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => RetirarVehiculo(
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
                  //textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'Prompt'),
                ),
                subtitle: Text(
                  parqueos[posicion].hora_entrada.substring(11, 16),
                  //textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      fontFamily: 'Prompt'),
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
                ),
              ),
            ),
          );
        });
  }
}
