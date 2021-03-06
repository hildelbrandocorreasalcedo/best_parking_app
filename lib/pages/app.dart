import 'package:best_parking_app/pages/adicionar.dart';
import 'package:best_parking_app/pages/lista.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BestParkingAPP',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Prompt',
      ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
      },
    );
  }
}
