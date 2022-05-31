import 'package:best_parking_app/models/parqueo.dart';
import 'package:flutter/material.dart';
import 'package:best_parking_app/pages/adicionar.dart';
import '../peticiones/peticioneshttp.dart';
import 'lista.dart';

class FacturarParqueo extends StatefulWidget {
  final idperfil;
  final List<Parqueo> perfil;
  FacturarParqueo({required this.perfil, this.idperfil});

  @override
  _FacturarPaqueoState createState() => _FacturarPaqueoState();
}

class _FacturarPaqueoState extends State<FacturarParqueo> {
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
    controlhora_salida =
        TextEditingController(text: widget.perfil[widget.idperfil].hora_salida);
    controlhora_salida =
        TextEditingController(text: widget.perfil[widget.idperfil].numerohoras);
    controlhora_salida =
        TextEditingController(text: widget.perfil[widget.idperfil].valorhora);
    controlhora_salida =
        TextEditingController(text: widget.perfil[widget.idperfil].totalpagar);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Facturar Parqueo"),
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
                      labelText: 'ingrese la hora de entrada  ',
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
              TextField(
                controller: controlhora_salida,
                decoration: InputDecoration(labelText: "Hora de salida"),
              ),
              TextField(
                controller: controlnumerohoras,
                decoration: InputDecoration(labelText: "Numero de horas"),
              ),
              TextField(
                controller: controlvalorhora,
                decoration: InputDecoration(labelText: "Valor por hora"),
              ),
              TextField(
                controller: controltotalpagar,
                decoration: InputDecoration(labelText: "Total a pagar"),
              ),
              ElevatedButton(
                child: Text("Facturar Parqueo"),
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
