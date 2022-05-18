import 'package:best_parking_app/pages/app.dart';
import 'package:flutter/material.dart';

import '../models/mensajero.dart';
import 'lista.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController controladorUsuario;
  late TextEditingController controladorContrasena;

  @override
  void initState() {
    controladorUsuario = TextEditingController();
    controladorContrasena = TextEditingController();
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
        padding: EdgeInsets.symmetric(horizontal: 90.0),
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
              hintText: 'ejemplo@gmail.com',
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
        padding: EdgeInsets.symmetric(horizontal: 90.0),
        child: TextField(
          controller: controladorContrasena,
          obscureText: true,
          cursorColor: Colors.red.shade400,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          decoration: InputDecoration(
              icon: Icon(Icons.lock),
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
        color: Colors.green.shade400,
        onPressed: () {
          if (controladorUsuario.text == usuarios[0].usuario.toString() &&
              controladorContrasena.text == usuarios[0].contrasena.toString()) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaMensajeros(title: 'Lista Mensajeros'),
                ));
            controladorUsuario.text = '';
            controladorContrasena.text = '';
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
                              'Atras',
                              style: TextStyle(color: Colors.red, fontSize: 15),
                            ),
                          ),
                        ]));
          }
        },
      );
    });
  }
}
