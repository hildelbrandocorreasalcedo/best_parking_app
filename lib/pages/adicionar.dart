import 'package:flutter/material.dart';

import '../peticiones/peticioneshttp.dart';

//--------Parqueo

class AgregarParqueo extends StatefulWidget {
  AgregarParqueo({Key? key}) : super(key: key);

  @override
  State<AgregarParqueo> createState() => _AgregarParqueoState();
}

class _AgregarParqueoState extends State<AgregarParqueo> {
  TextEditingController controltipo = TextEditingController();
  TextEditingController controlplaca = TextEditingController();
  TextEditingController controlmarca = TextEditingController();
  TextEditingController controlhora_entrada = TextEditingController();
  TextEditingController controlfoto_vehiculo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Parqueo'),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Center(
            child: ListView(
          children: [
            TextField(
              controller: controltipo,
              decoration:
                  InputDecoration(labelText: 'Ingrese el tipo de vehiculo'),
            ),
            TextField(
              controller: controlplaca,
              decoration: InputDecoration(labelText: 'Ingrese la placa'),
            ),
            TextField(
              controller: controlmarca,
              decoration: InputDecoration(labelText: 'Ingrese la marca'),
            ),
            TextField(
              controller: controlhora_entrada,
              decoration:
                  InputDecoration(labelText: 'Ingrese la de hora entrada'),
            ),
            TextField(
              controller: controlfoto_vehiculo,
              decoration:
                  InputDecoration(labelText: 'Ingrese la foto vehiculo'),
            ),
            ElevatedButton(
                onPressed: () {
                  adicionarParqueo(
                      controltipo.text,
                      controlplaca.text,
                      controlmarca.text,
                      controlhora_entrada.text,
                      controlfoto_vehiculo.text);
                  Navigator.of(context).pop();
                },
                child: Text('Adicionar Parqueo'))
          ],
        )),
      ),
    );
  }
}
