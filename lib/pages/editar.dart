import 'package:best_parking_app/models/parqueo.dart';
import 'package:flutter/material.dart';
import 'package:best_parking_app/pages/adicionar.dart';
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
  TextEditingController controlhora_salida = TextEditingController();
  TextEditingController controlnumerohoras = TextEditingController();
  TextEditingController controlvalorhora = TextEditingController();
  TextEditingController controltotalpagar = TextEditingController();

  late DateTime? horaentrada;

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
        padding: EdgeInsets.all(5),
        child: Center(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  cursorColor: Colors.red.shade400,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  controller: controlplaca,
                  decoration: InputDecoration(
                      icon: Icon(Icons.account_box),
                      labelText: 'Placa del vehiculo'),
                  onChanged: (value) {},
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  cursorColor: Colors.red.shade400,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  controller: controltipo,
                  decoration: InputDecoration(
                      icon: Icon(Icons.account_box),
                      labelText: 'Tipo del vehiculo'),
                  onChanged: (value) {},
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  cursorColor: Colors.red.shade400,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  controller: controlmarca,
                  decoration: InputDecoration(
                      icon: Icon(Icons.account_box),
                      labelText: 'Marca del vehiculo'),
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  controller: controlhora_entrada,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Hora de entrada  ',
                      suffix: GestureDetector(
                        child: Icon(Icons.close),
                        onTap: () {
                          controlhora_entrada.clear();
                        },
                      )),
                  onTap: () async {
                    var nowTime = DateTime.now();
                    controlhora_entrada.text = '$nowTime';
                    horaentrada = nowTime;
                  },
                ),
              ),
              ElevatedButton(
                child: Text("Modificar Parqueo"),
                onPressed: () {
                  editarParqueo(
                    widget.perfil[widget.idperfil].id_parqueo,
                    controltipo.text,
                    controlplaca.text,
                    controlmarca.text,
                    controlhora_entrada.text,
                    controlhora_salida.text,
                    controlnumerohoras.text,
                    controlvalorhora.text,
                    controltotalpagar.text,
                  );
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
