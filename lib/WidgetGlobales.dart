import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

// ignore: must_be_immutable
class WidgetGlobales {
  Widget crearCampoTexto(
      TextEditingController controller, String label, IconData icon) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                icon: Icon(icon),
                filled: true,
                labelText: label,
                fillColor: Colors.transparent,
                hintText: label,
                suffix: GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () {
                    controller.clear();
                  },
                )),
          ),
        );
      },
    );
  }

  Widget crearCampoContrasenia(
      TextEditingController controller, String label, IconData icon) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: controller,
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(icon),
                filled: true,
                labelText: label,
                fillColor: Colors.transparent,
                hintText: label,
                suffix: GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () {
                    controller.clear();
                  },
                )),
          ),
        );
      },
    );
  }

  void verDialogoAdvertencia(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title:
                  mostrarTitulo('Oh No :(', Icons.shield, Colors.orange[400]),
              content: Text(message, style: TextStyle(color: Colors.blueGrey)),
              actions: [
                crearBoton(() => Navigator.pop(context), '  Volver',
                    Icons.outbond, Colors.blueGrey),
              ],
            ));
  }

  Row mostrarTitulo(String title, IconData icon, Color color) {
    return Row(
      children: [
        Icon(icon, color: color),
        Text(title, style: TextStyle(color: color)),
      ],
    );
  }

  TextButton crearBoton(
      Function function, String text, IconData icon, Color color) {
    return TextButton(
        onPressed: function,
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(icon, color: color),
            Text(text, style: TextStyle(color: color)),
          ]),
        ));
  }
}

// ignore: must_be_immutable
class BasicDateField extends StatelessWidget {
  DateTime fechaActual;
  BasicDateField(this.fechaActual);
  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: DateTimeField(
        decoration: InputDecoration(
          icon: Icon(Icons.date_range_outlined),
          filled: true,
          labelText: "Fecha",
          fillColor: Colors.transparent,
          hintText: "Fecha",
        ),
        format: format,
        onChanged: (dateTime) {
          fechaActual = dateTime;
        },
        initialValue: fechaActual,
        onShowPicker: (context, fechaActual) {
          return showDatePicker(
              context: context,
              firstDate: DateTime(1999, 1, 1),
              initialDate: fechaActual,
              lastDate: DateTime.now());
        },
      ),
    );
  }

  DateTime getFechaActual() {
    return this.fechaActual;
  }
}
