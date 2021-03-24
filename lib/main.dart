import 'package:flutter/material.dart';
import 'IniciarSesion.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: IniciarSesion.id,
      routes: {
        IniciarSesion.id: (context) => IniciarSesion(),
      },
    );
  }
}
