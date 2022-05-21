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


/*
//--------mensajeros

class AgregarMensajero extends StatefulWidget {
  AgregarMensajero({Key? key}) : super(key: key);

  @override
  State<AgregarMensajero> createState() => _AgregarMensajeroState();
}

class _AgregarMensajeroState extends State<AgregarMensajero> {
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlfoto = TextEditingController();
  TextEditingController controlplaca = TextEditingController();
  TextEditingController controltelefono = TextEditingController();
  TextEditingController controlwhatsapp = TextEditingController();
  TextEditingController controlmoto = TextEditingController();
  bool soat = false;
  bool tecno = false;
  bool activo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Mensajero'),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Center(
            child: ListView(
          children: [
            TextField(
              controller: controlNombre,
              decoration: InputDecoration(labelText: 'Ingrese el Nombre'),
            ),
            TextField(
              controller: controlfoto,
              decoration: InputDecoration(labelText: 'Ingrese la Foto'),
            ),
            TextField(
              controller: controlplaca,
              decoration: InputDecoration(labelText: 'Ingrese la Placa'),
            ),
            TextField(
              controller: controltelefono,
              decoration: InputDecoration(labelText: 'Ingrese el Telefono'),
            ),
            TextField(
              controller: controlwhatsapp,
              decoration: InputDecoration(labelText: 'Ingrese el Whatsapp'),
            ),
            TextField(
              controller: controlmoto,
              decoration: InputDecoration(labelText: 'Ingrese la Marca'),
            ),
            SwitchListTile(
              title: Text('Soat Vigente?'),
              value: soat,
              onChanged: (bool value) {
                setState(() {
                  soat = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Tecno Vigente?'),
              value: tecno,
              onChanged: (bool value) {
                setState(() {
                  tecno = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Activo?'),
              value: activo,
              onChanged: (bool value) {
                setState(() {
                  activo = value;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  String soatr = '';
                  String tecnor = '';
                  String activor = '';
                  soat ? soatr = 'SI' : soatr = 'NO';
                  tecno ? tecnor = 'SI' : soatr = 'NO';
                  activo ? activor = 'SI' : soatr = 'NO';
                  adicionarMensajero(
                      controlNombre.text,
                      controlfoto.text,
                      controlplaca.text,
                      controltelefono.text,
                      controlwhatsapp.text,
                      controlmoto.text,
                      soatr,
                      tecnor,
                      activor);
                  Navigator.of(context).pop();
                },
                child: Text('Adicionar Mensajero'))
          ],
        )),
      ),
    );
  }
}
*/