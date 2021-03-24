import 'Persona.dart';
import 'package:flutter/material.dart';
import 'WidgetGlobales.dart';

void main() => runApp(ControlEstadoPersona("", Persona()));

// ignore: must_be_immutable
class ControlEstadoPersona extends StatefulWidget {
  Persona persona;
  WidgetGlobales globales = WidgetGlobales();
  String accion;
  ControlEstadoPersona(this.accion, this.persona);
  @override
  State<StatefulWidget> createState() {
    return new Regitrarpersona();
  }
}

class Regitrarpersona extends State<ControlEstadoPersona> {
  TextEditingController nombre;
  TextEditingController apellido;
  TextEditingController foto;
  TextEditingController profesion;
  BasicDateField campoFecha;

  @override
  void initState() {
    switch (widget.accion) {
      case "Registrar Persona":
        nombre = TextEditingController();
        apellido = TextEditingController();
        foto = TextEditingController();
        profesion = TextEditingController();
        campoFecha = BasicDateField(DateTime.now());
        break;
      case "Actualizar Persona":
        nombre = TextEditingController(text: widget.persona.nombre);
        apellido = TextEditingController(text: widget.persona.apellido);
        foto = TextEditingController(text: widget.persona.foto);
        profesion = TextEditingController(text: widget.persona.profesion);
        campoFecha = BasicDateField(widget.persona.fechaNacimiento);
        break;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Registrar persona",
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.accion),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 15.0,
            ),
            widget.globales
                .crearCampoTexto(nombre, "Nombre", Icons.account_circle),
            SizedBox(
              height: 15.0,
            ),
            widget.globales
                .crearCampoTexto(apellido, "apellido", Icons.account_circle),
            SizedBox(
              height: 15.0,
            ),
            widget.globales
                .crearCampoTexto(profesion, "profesion", Icons.paste_outlined),
            SizedBox(
              height: 15.0,
            ),
            campoFecha,
            SizedBox(
              height: 15.0,
            ),
            widget.globales.crearCampoTexto(foto, "foto", Icons.photo),
            SizedBox(
              height: 25.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (foto.text.isNotEmpty &&
                    nombre.text.isNotEmpty &&
                    apellido.text.isNotEmpty &&
                    profesion.text.isNotEmpty) {
                  widget.persona.nombre = nombre.text;
                  widget.persona.apellido = apellido.text;
                  widget.persona.foto = foto.text;
                  widget.persona.profesion = profesion.text;
                  widget.persona.fechaNacimiento = campoFecha.getFechaActual();
                  Navigator.pop(context, widget.persona);
                } else {
                  widget.globales.verDialogoAdvertencia(
                      context, "Hay Uno O Mas Campos Vacios");
                }
              },
              child: Text(widget.accion),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
