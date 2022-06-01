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
  late DateTime? horasalida;

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
    controlnumerohoras =
        TextEditingController(text: widget.perfil[widget.idperfil].numerohoras);
    controlvalorhora =
        TextEditingController(text: widget.perfil[widget.idperfil].valorhora);
    controltotalpagar =
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
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                "Retirar Vehiculo",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(35, 10, 35, 0),
              height: 390,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 20,
                      left: (MediaQuery.of(context).size.width / 2) - 135,
                      child: Container(
                        //
                        height: 60,
                        width: 200,
                        child: Card(
                          elevation: 2,
                          color: Colors.blue[200],
                          child: Center(
                            child: Text(
                              controlplaca.text,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 100),
                            child: Column(
                              children: [
                                Text(
                                  'Tipo de vehiculo:\n' + controltipo.text,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  '\nMarca del vehiculo:\n' + controlmarca.text,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  '\nFecha de entrada:\n' +
                                      controlhora_entrada.text.substring(0, 10),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  'Hora de entrada:\n' +
                                      controlhora_entrada.text
                                          .substring(11, 16),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  '\nTarifa por hora:\n' +
                                      controlvalorhora.text,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                36,
                10,
                36,
                0,
              ),
              child: RaisedButton(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10.0),
                  child: Text(
                    'RETIRAR VEHICULO',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 10.0,
                color: Colors.blue.shade400,
                onPressed: () {},
              ),
            )
          ],
        ));

    /*Scaffold(
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
              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  controller: controlhora_salida,
                  decoration: InputDecoration(
                      filled: true,
                      labelText: 'Hora de salida  ',
                      suffix: GestureDetector(
                        child: Icon(Icons.close),
                        onTap: () {
                          controlhora_salida.clear();
                        },
                      )),
                  onTap: () async {
                    var nowTime = DateTime.now();
                    controlhora_salida.text = '$nowTime';
                    horasalida = nowTime;
                  },
                ),
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
                  facturarParqueo(
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
    );*/
  }
}
