import 'package:best_parking_app/pages/adicionar.dart';
import 'package:best_parking_app/pages/inicioOperador.dart';
import 'package:best_parking_app/peticiones/peticioneshttp.dart';
import 'package:flutter/material.dart';

import '../models/usuario.dart';
import '../peticiones/peticionesusuarios.dart';
import 'lista.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController controladorUsuario;
  late TextEditingController controladorClave;

  @override
  void initState() {
    controladorUsuario = TextEditingController(text: 'admin');
    controladorClave = TextEditingController(text: '123');
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: CircleAvatar(
                  child: Image(
                    image: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/64/64572.png'),
                    height: 200,
                  ),
                  radius: 60.0,
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              _userTextField(),
              SizedBox(
                height: 15,
              ),
              _passwordField(),
              SizedBox(
                height: 20,
              ),
              _bottonLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          cursorColor: Colors.red.shade400,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          controller: controladorUsuario,
          decoration: InputDecoration(
              icon: Icon(Icons.account_box),
              suffix: GestureDetector(
                child: Icon(Icons.close),
                onTap: () {
                  controladorUsuario.clear();
                },
              ),
              hintText: 'User123',
              labelText: 'USUARIO'),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _passwordField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: TextField(
          controller: controladorClave,
          obscureText: true,
          cursorColor: Colors.red.shade400,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          decoration: InputDecoration(
              icon: Icon(Icons.lock),
              suffix: GestureDetector(
                child: Icon(Icons.close),
                onTap: () {
                  controladorClave.clear();
                },
              ),
              hintText: 'Ejemplo123',
              labelText: 'CLAVE'),
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _bottonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
          child: Text(
            'INICIAR SESION',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10.0,
        color: Colors.blue.shade400,
        onPressed: () {
          validarUsuarios(
                  http.Client(), controladorUsuario.text, controladorClave.text)
              .then((response) {
            print(response.length);
            if (response.length == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => inicioOperador(title: 'Usuarios'),
                  ));
              controladorUsuario.text = '';
              controladorClave.text = '';
            } else {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                          title: Text('ADVERTENCIA'),
                          content: Text('Usuario/Clave Incorrectos',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                              child: Text(
                                'ATRAS',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 15),
                              ),
                            ),
                          ]));
            }
          });
        },
      );
    });
  }
}
