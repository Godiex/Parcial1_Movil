class Persona {
  String nombre;
  String apellido;
  String profesion;
  String foto;
  int edad;
  DateTime fechaNacimiento;

  Persona(
      {this.apellido,
      this.profesion,
      this.edad,
      this.foto,
      this.nombre,
      this.fechaNacimiento});

  String obtenerEdad() {
    double edad = DateTime.now().difference(this.fechaNacimiento).inDays / 365;
    return edad.toInt().toString();
  }

  String obtenerMombreCompleto() {
    return nombre + " " + apellido;
  }

  String mostrarFechaYEdad() {
    return this.fechaNacimiento.day.toString() +
        '/' +
        this.fechaNacimiento.month.toString() +
        '/' +
        this.fechaNacimiento.year.toString() +
        '\n' +
        this.obtenerEdad() +
        ' años';
  }
}
