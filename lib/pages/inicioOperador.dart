// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:best_parking_app/pages/login.dart';
import 'package:best_parking_app/pages/perfil.dart';
import 'package:best_parking_app/pages/salidavehiculo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../peticiones/peticioneshttp.dart';
import 'adicionar.dart';
import 'lista.dart';

class inicioOperador extends StatefulWidget {
  inicioOperador({Key? key}) : super(key: key);
  @override
  State<inicioOperador> createState() => _inicioOperadorState();
}

class _inicioOperadorState extends State<inicioOperador> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int indice = 0;

  final paginas = [
    AgregarParqueo(),
    salidaVehiculo(),
    ListaParqueos(),
    ListaParqueos(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.login,
        size: 30,
      ),
      Icon(
        Icons.logout,
        size: 30,
      ),
      Icon(
        Icons.list,
        size: 30,
      ),
      Icon(
        Icons.monetization_on,
        size: 30,
      ),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            /*title: Text(
              'GESTION DE PARQUEOS',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              ),
            ),*/
            title: Image.asset('img/Icono.png', scale: 3),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 7, spreadRadius: 3, color: Colors.white)
                  ], shape: BoxShape.circle, color: Colors.white),
                  child: IconButton(
                    iconSize: 25,
                    icon: const Icon(Icons.home),
                    color: Colors.blue.shade400,
                    tooltip: 'Salir',
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 26,
                )
              ],
            ),
            centerTitle: true,
            toolbarHeight: 60,
            backgroundColor: Colors.blue.shade400,
            //elevation: 14,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70))),
            actions: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          blurRadius: 7, spreadRadius: 3, color: Colors.white)
                    ], shape: BoxShape.circle, color: Colors.white),
                    child: IconButton(
                      icon: const Icon(Icons.output_outlined),
                      color: Colors.blue.shade400,
                      tooltip: 'Salir',
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginPage()));
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  )
                ],
              ),
            ]),
        //drawer: Drawer(),paginas:[indice],
        body: paginas[indice],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Colors.white),
          ),
          child: CurvedNavigationBar(
            key: navigationKey,
            color: Colors.blue.shade400,
            backgroundColor: Colors.transparent,
            height: 50,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(microseconds: 300),
            index: indice,
            items: items,
            onTap: (index) => setState(() {
              indice = index;
            }),
          ),
        ),
      ),
    );
  }
}
