import 'package:best_parking_app/pages/perfil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/mensajero.dart';
import '../models/parqueo.dart';
import '../models/vehiculo.dart';
import '../peticiones/peticioneshttp.dart';
import 'adicionar.dart';

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
        title: Text('Lista de Parqueos'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AgregarParqueo())).then((value) {
                  setState(() {
                    getInfo1(context);
                  });
                });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: getInfo1(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                  child: Image.network(parqueos[posicion].foto_vehiculo),
                ),
                title: Text(parqueos[posicion].placa),
                subtitle: Text(parqueos[posicion].tipo),
                trailing: Container(
                    width: 80,
                    height: 40,
                    /*color: Colors.yellow,*/
                    child: Text(parqueos[posicion].estado)),
              ),
            ),
          );
        });
  }
}


//----------Vehiculo


/*
//----------mensajero

class ListaMensajeros extends StatefulWidget {
  const ListaMensajeros({Key? key}) : super(key: key);

  @override
  State<ListaMensajeros> createState() => _ListaMensajerosState();
}

class _ListaMensajerosState extends State<ListaMensajeros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Mensajeros'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AgregarMensajero())).then((value) {
                  setState(() {
                    getInfo(context);
                  });
                });
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: getInfo(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.update),
      ),
    );
  }
}

Widget getInfo(BuildContext context) {
  return FutureBuilder(
      future: listaMensajeros(http.Client()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();

          case ConnectionState.done:
            return snapshot.data != null
                ? VistaMensajeros(mensajeros: snapshot.data)
                : Text('No hay Datos');

          default:
            return Text('Recargar los datos');
        }
      });
}

class VistaMensajeros extends StatelessWidget {
  final List<Mensajero> mensajeros;
  const VistaMensajeros({Key? key, required this.mensajeros}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mensajeros.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Perfilmensajero(
                          perfil: mensajeros, idperfil: posicion)));
            },
            leading: Container(
              padding: EdgeInsets.all(5),
              width: 50,
              height: 50,
              child: Image.network(mensajeros[posicion].foto),
            ),
            title: Text(mensajeros[posicion].nombre),
            subtitle: Text(mensajeros[posicion].moto),
            trailing: Container(
                width: 80,
                height: 40,
                color: Colors.yellow,
                child: Text(mensajeros[posicion].placa)),
          );
        });
  }
}
*/