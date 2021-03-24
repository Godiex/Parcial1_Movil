import 'package:flutter/material.dart';
import 'WidgetGlobales.dart';
import 'PaginaPrincipal.dart';

class IniciarSesion extends StatefulWidget {
  static String id = "IniciarSesion";

  @override
  _IniciarSesionState createState() => _IniciarSesionState();
}

class _IniciarSesionState extends State<IniciarSesion> {
  WidgetGlobales _widget = WidgetGlobales();
  TextEditingController nombreUsuario;
  TextEditingController contrasenia;

  @override
  void initState() {
    nombreUsuario = TextEditingController();
    contrasenia = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Iniciar sesión'),
        ),
        body: Center(
          child: Column(
            children: [
              Icon(
                Icons.supervised_user_circle,
                size: 200.0,
                color: Colors.blue.shade400,
              ),
              SizedBox(
                height: 15.0,
              ),
              _widget.crearCampoTexto(nombreUsuario, "Nombre Usuario",
                  Icons.supervised_user_circle),
              SizedBox(
                height: 15.0,
              ),
              _widget.crearCampoContrasenia(
                  contrasenia, "Contraseña", Icons.lock),
              SizedBox(
                height: 25.0,
              ),
              crearBotonInicioSesion(
                  iniciarSesion, "Iniciar Sesion", Colors.blue)
            ],
          ),
        ),
      ),
    );
  }

  void iniciarSesion() {
    if (nombreUsuario.text.isNotEmpty && contrasenia.text.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PaginaPrincipal(nombreUsuario.text)));
    } else {
      _widget.verDialogoAdvertencia(context, "Hay Uno o Mas Campos Vacios");
    }
  }

  Widget crearBotonInicioSesion(Function funcion, String texto, Color color) =>
      StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              child: Text(
                texto,
                style: TextStyle(color: Colors.white),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10.0,
            color: color,
            onPressed: funcion,
          );
        },
      );
}
