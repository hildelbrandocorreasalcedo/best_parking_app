import 'package:best_parking_app/pages/perfil.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/mensajero.dart';
import '../peticiones/peticioneshttp.dart';
import 'adicionar.dart';

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
