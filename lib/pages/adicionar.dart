//import 'package:dropdownfield/dropdownfield.dart';
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
  TextEditingController controlnumerohoras = TextEditingController();
  TextEditingController controlvalorhora = TextEditingController();
  TextEditingController controltotalpagar = TextEditingController();

  String seleccionado_1 = "";
  late DateTime? horaentrada;

  @override
  /*
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
                    adicionarParqueo(
                      controltipo.text,
                      controlplaca.text,
                      controlmarca.text,
                      horaentrada.toString(),
                      controlhora_salida.text,
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
        )),
      ),
    );
  }*/

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Adicionar Parqueo'),
          backgroundColor: Colors.blue.shade400,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      adicionarParqueo(
                        controltipo.text,
                        controlplaca.text,
                        controlmarca.text,
                        horaentrada.toString(),
                        controlhora_salida.text,
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
