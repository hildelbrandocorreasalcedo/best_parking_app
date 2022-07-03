import 'package:flutter/material.dart';
import 'package:best_parking_app/models/parqueo.dart';
import 'package:http/http.dart' as http;
import '../../peticiones/peticioneshttp.dart';

class ArqueoGananacias extends StatefulWidget {
  const ArqueoGananacias({Key? key}) : super(key: key);

  @override
  _ArqueoGananaciasState createState() => _ArqueoGananaciasState();
}

class _ArqueoGananaciasState extends State<ArqueoGananacias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getInfo1(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            getInfo1(context);
          });
        },
        child: Icon(Icons.update),
      ),
    );
  }
}

Widget getInfo1(BuildContext context) {
  return FutureBuilder(
      future: listaParqueosInactivos(http.Client()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());

          case ConnectionState.done:
            return snapshot.data != null
                ? vistaArqueoGananacias(parqueos: snapshot.data)
                : Text('No hay Datos');

          default:
            return Text('Recargar los datos');
        }
      });
}

class vistaArqueoGananacias extends StatelessWidget {
  TextEditingController controlhora_salida = TextEditingController();
  TextEditingController controltotalpagar = TextEditingController();

  final ValorPagar = 0;
  late DateTime? horasalida;
  var nowTime = DateTime.now();
  final List<Parqueo> parqueos;
  vistaArqueoGananacias({Key? key, required this.parqueos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              "Consulta Financiera",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'Prompt',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(35, 10, 35, 0),
            height: 690,
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
                            controlhora_salida.text = '$nowTime',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              fontFamily: 'Prompt',
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
                                '\nTotal de Vehiculos:\n' +
                                    calcularCantidadVehiculos().toString(),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'Prompt',
                                ),
                              ),
                              Text(
                                '\nTotal Recaudado:\n' +
                                    calcularSumaTotal().toString(),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: 'Prompt',
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
        ],
      ),
    );
  }

  int calcularCantidadVehiculos() {
    int cantidadVehiculos = 0;
    for (var parqueo in parqueos) {
      cantidadVehiculos = parqueos.length;
    }
    return cantidadVehiculos;
  }

  double calcularSumaTotal() {
    double sumaTotal = 0;
    for (var parqueo in parqueos) {
      var totalpagar = double.parse(parqueo.totalpagar);
      sumaTotal = sumaTotal + totalpagar;
    }
    return sumaTotal;
  }
}
