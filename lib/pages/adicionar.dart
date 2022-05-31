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
            /*Padding(
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
            ///////////////////////////////////////////////
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    DropDownField(
                      controller: controltipo,
                      hintText: "Tipo de Vehiculo",
                      enabled: true,
                      itemsVisibleInDropdown: 5,
                      items: ["CARRO", "MOTO"],
                      onValueChanged: (value) {
                        setState(() {
                          seleccionado_1 = value;
                        });
                      },
                    )
                  ]),
            ),

            TextField(
              controller: controlhora_entrada,
              decoration:
                  InputDecoration(labelText: 'Ingrese la de hora entrada'),
            ),
            TextField(
              controller: controlhora_salida,
              decoration:
                  InputDecoration(labelText: 'Ingrese la de hora salida'),
            ),*/

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
  }

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {});
    }
  }
}
