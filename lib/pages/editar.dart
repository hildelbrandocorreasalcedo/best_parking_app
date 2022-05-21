import 'package:flutter/material.dart';
import 'package:best_parking_app/pages/adicionar.dart';
import '../models/mensajero.dart';
import '../peticiones/peticioneshttp.dart';
import 'lista.dart';

class ModificarMensajero extends StatefulWidget {
  final idperfil;
  final List<Mensajero> perfil;
  ModificarMensajero({required this.perfil, this.idperfil});

  @override
  _ModificarMensajeroState createState() => _ModificarMensajeroState();
}

class _ModificarMensajeroState extends State<ModificarMensajero> {
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlfoto = TextEditingController();
  TextEditingController controlplaca = TextEditingController();
  TextEditingController controltelefono = TextEditingController();
  TextEditingController controlwhatsapp = TextEditingController();
  TextEditingController controlmoto = TextEditingController();

  bool soat = false;
  bool tecno = false;
  bool activo = false;
  late String soattxt;
  late String tecnotxt;
  late String activotxt;

  @override
  void initState() {
    controlNombre =
        TextEditingController(text: widget.perfil[widget.idperfil].nombre);
    controlfoto =
        TextEditingController(text: widget.perfil[widget.idperfil].foto);
    controlplaca =
        TextEditingController(text: widget.perfil[widget.idperfil].placa);
    controltelefono =
        TextEditingController(text: widget.perfil[widget.idperfil].telefono);
    controlwhatsapp =
        TextEditingController(text: widget.perfil[widget.idperfil].whatsapp);
    controlmoto =
        TextEditingController(text: widget.perfil[widget.idperfil].moto);

    soattxt = widget.perfil[widget.idperfil].soat;
    tecnotxt = widget.perfil[widget.idperfil].tecno;
    activotxt = widget.perfil[widget.idperfil].activo;

    widget.perfil[widget.idperfil].soat == 'SI' ? soat = true : soat = false;
    widget.perfil[widget.idperfil].tecno == 'SI' ? tecno = true : tecno = false;
    widget.perfil[widget.idperfil].activo == 'SI'
        ? activo = true
        : activo = false;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Mensajero"),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              TextField(
                controller: controlNombre,
                decoration: InputDecoration(labelText: "Nombre"),
              ),
              TextField(
                controller: controlfoto,
                decoration: InputDecoration(labelText: "Foto"),
              ),
              TextField(
                controller: controlplaca,
                decoration: InputDecoration(labelText: "Placa"),
              ),
              TextField(
                controller: controltelefono,
                decoration: InputDecoration(labelText: "Telefono"),
              ),
              TextField(
                controller: controlwhatsapp,
                decoration: InputDecoration(labelText: "WhatsApp"),
              ),
              TextField(
                controller: controlmoto,
                decoration: InputDecoration(labelText: "Moto"),
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
                title: Text('Tecnomecanica Vigente?'),
                value: tecno,
                onChanged: (bool value) {
                  setState(() {
                    tecno = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Activo ?'),
                value: activo,
                onChanged: (bool value) {
                  setState(() {
                    activo = value;
                  });
                },
              ),
              ElevatedButton(
                child: Text("Modificar Mensajero"),
                onPressed: () {
                  soat == true ? soattxt = "SI" : soattxt = "NO";
                  tecno == true ? tecnotxt = "SI" : tecnotxt = "NO";
                  activo == true ? activotxt = "SI" : activotxt = "NO";

                  editarMensajero(
                      widget.perfil[widget.idperfil].id,
                      controlNombre.text,
                      controlfoto.text,
                      controlplaca.text,
                      controltelefono.text,
                      controlwhatsapp.text,
                      controlmoto.text,
                      soattxt,
                      tecnotxt,
                      activotxt);

                  //Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListaMensajeros(),
                        //builder: (context) => ListaMensajeros(title: 'Lista Mensajeros'),
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
