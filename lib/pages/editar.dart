import 'package:best_parking_app/models/parqueo.dart';
import 'package:flutter/material.dart';
import 'package:best_parking_app/pages/adicionar.dart';
import '../models/mensajero.dart';
import '../peticiones/peticioneshttp.dart';
import 'lista.dart';

class ModificarParqueo extends StatefulWidget {
  final idperfil;
  final List<Parqueo> perfil;
  ModificarParqueo({required this.perfil, this.idperfil});

  @override
  _ModificarPaqueoState createState() => _ModificarPaqueoState();
}

class _ModificarPaqueoState extends State<ModificarParqueo> {
  TextEditingController controltipo = TextEditingController();
  TextEditingController controlplaca = TextEditingController();
  TextEditingController controlmarca = TextEditingController();
  TextEditingController controlhora_entrada = TextEditingController();
  TextEditingController controlfoto_vehiculo = TextEditingController();

  @override
  void initState() {
    controltipo =
        TextEditingController(text: widget.perfil[widget.idperfil].tipo);
    controlplaca =
        TextEditingController(text: widget.perfil[widget.idperfil].placa);
    controlplaca =
        TextEditingController(text: widget.perfil[widget.idperfil].placa);
    controlmarca =
        TextEditingController(text: widget.perfil[widget.idperfil].marca);
    controlhora_entrada = TextEditingController(
        text: widget.perfil[widget.idperfil].hora_entrada);
    controlfoto_vehiculo = TextEditingController(
        text: widget.perfil[widget.idperfil].foto_vehiculo);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("modificar Parqueo"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              TextField(
                controller: controltipo,
                decoration: InputDecoration(labelText: "Tipo de vehiculo"),
              ),
              TextField(
                controller: controlplaca,
                decoration: InputDecoration(labelText: "Placa del vehiculo"),
              ),
              TextField(
                controller: controlmarca,
                decoration: InputDecoration(labelText: "Marca del vehiculo"),
              ),
              TextField(
                controller: controlhora_entrada,
                decoration: InputDecoration(labelText: "Hora de entrada"),
              ),
              TextField(
                controller: controlfoto_vehiculo,
                decoration: InputDecoration(labelText: "Foto del vehiculo"),
              ),
              ElevatedButton(
                child: Text("Modificar Mensajero"),
                onPressed: () {
                  editarParqueo(
                      widget.perfil[widget.idperfil].id_parqueo,
                      controltipo.text,
                      controlplaca.text,
                      controlmarca.text,
                      controlhora_entrada.text,
                      controlfoto_vehiculo.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListaParqueos(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
