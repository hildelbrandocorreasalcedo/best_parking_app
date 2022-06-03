//import 'package:dropdownfield/dropdownfield.dart';
// ignore_for_file: prefer_const_constructors

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
  TextEditingController controlhora_salida = TextEditingController();
  TextEditingController controlestado = TextEditingController();
  TextEditingController controlnumerohoras = TextEditingController();
  TextEditingController controlvalorhora = TextEditingController();
  TextEditingController controltotalpagar = TextEditingController();

  String selectedValue = 'SELECCIONAR';
  String seleccionado_1 = "";
  late DateTime? horaentrada;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'PARQUEO DE VEHICULOS',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
          ),
          toolbarHeight: 90,
          backgroundColor: Colors.blue.shade400,
          elevation: 14,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                  bottomLeft: Radius.circular(70))),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.blueAccent,
                ),
                validator: (value) => value == null ? "Select a country" : null,
                dropdownColor: Colors.blueAccent,
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                    controltipo.text = newValue;
                  });
                },
                items: <String>['SELECCIONAR', 'CARRO', 'MOTO']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
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
              /* Container(
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
              ),*/
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
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 60.0,
                  onPressed: () {
                    if (controltipo.text.isNotEmpty &&
                        controlplaca.text.isNotEmpty &&
                        controlmarca.text.isNotEmpty) {
                      var nowTime = DateTime.now();
                      horaentrada = nowTime;
                      if (controltipo.text == "CARRO") {
                        controlvalorhora.text = "2000";
                      } else {
                        controlvalorhora.text = "1000";
                      }

                      adicionarParqueo(
                        selectedValue.toString(),
                        controlplaca.text,
                        controlmarca.text,
                        horaentrada.toString(),
                        controlhora_salida.text,
                        controlestado.text = "ACTIVO",
                        controlnumerohoras.text,
                        controlvalorhora.text,
                        controltotalpagar.text,
                      );

                      Navigator.of(context).pop();
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                content: Text('Agregado correctamente'),
                              ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                content: Text('No se aceptan campos vacios'),
                              ));
                    }
                  },
                  color: Colors.lightBlue,
                  child: Text('Registrar',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {});
    }
  }
}
