import 'package:flutter/material.dart';
import 'WidgetGlobales.dart';
import 'Persona.dart';
import 'GestionPersona.dart';

void main() => runApp(MaterialApp(home: PaginaPrincipal('')));

// ignore: must_be_immutable
class PaginaPrincipal extends StatefulWidget {
  String nombreUsuario;
  PaginaPrincipal(this.nombreUsuario);
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  WidgetGlobales _widget = WidgetGlobales();
  List<Persona> personas = [
    Persona(
        foto:
            'https://scontent.fbaq5-1.fna.fbcdn.net/v/t1.0-1/c0.53.320.320a/p320x320/83414083_1195745683964601_6712967904360398848_o.jpg?_nc_cat=109&ccb=1-3&_nc_sid=7206a8&_nc_eui2=AeHo7DjWuSHq1yj9k01ohFkKPZwk3QmYhEA9nCTdCZiEQF6pmnbMLmsk6o54mBwNtcvoYZ3vQZu18gzhSblLI2Mb&_nc_ohc=PzJFNdgEGpAAX8wL-tJ&_nc_ht=scontent.fbaq5-1.fna&tp=27&oh=6748da7be06bc48d6af95f76f9a4ac53&oe=607DA01D',
        nombre: 'Diego',
        apellido: 'Villa',
        profesion: 'Arquitecto de Software',
        fechaNacimiento: DateTime(2001, 01, 13))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Personas"),
        actions: [
          Center(child: Text(widget.nombreUsuario)),
          IconButton(
            icon: Icon(
              Icons.supervised_user_circle_rounded,
              color: Colors.white,
            ),
            onPressed: verPerfil(),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: personas.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(personas[index].obtenerMombreCompleto()),
            subtitle: Text(personas[index].mostrarFechaYEdad()),
            leading: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(personas[index].foto)))),
            trailing: Text(
              personas[index].profesion,
              textAlign: TextAlign.right,
            ),
            onTap: () {
              actualizarPersona(context, personas[index], index);
            },
            onLongPress: () {
              eliminarPersona(context, personas[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          registrarPersona(context, personas);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  registrarPersona(context, List<Persona> personas) async {
    final persona = await Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) =>
                    new ControlEstadoPersona("Registrar Persona", Persona())))
        as Persona;
    setState(() {
      personas.add(persona);
    });
  }

  eliminarPersona(context, Persona persona) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text('Eliminar Persona'),
              content: Text('¿Está seguro que desea eliminar la persona ?'),
              actions: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        this.personas.remove(persona);
                        Navigator.pop(context);
                      });
                    },
                    child: Text(
                      'Eliminar',
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ));
  }

  actualizarPersona(context, Persona persona, int index) async {
    final personaNueva = await Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) =>
              new ControlEstadoPersona('Actualizar Persona', persona)),
    ) as Persona;
    setState(() {
      this.personas.elementAt(index).nombre = personaNueva.nombre;
      this.personas.elementAt(index).apellido = personaNueva.apellido;
      this.personas.elementAt(index).foto = personaNueva.foto;
      this.personas.elementAt(index).profesion = personaNueva.profesion;
      this.personas.elementAt(index).fechaNacimiento =
          personaNueva.fechaNacimiento;
    });
  }

  verPerfil() {}
}
