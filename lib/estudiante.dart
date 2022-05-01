class Estudiante {
  final String matricula;
  final String nombreCompleto;
  final String carrera;
  final String semestre;
  final String telefono;
  final String correo;

  const Estudiante(
      {required this.matricula,
      required this.nombreCompleto,
      required this.carrera,
      required this.semestre,
      required this.telefono,
      required this.correo});

  factory Estudiante.fromJson(Map<String, dynamic> json) {
    return Estudiante(
        matricula: json['matricula'],
        nombreCompleto: json['nombreCompleto'],
        carrera: json['carrera'],
        semestre: json['semestre'],
        telefono: json['telefono'],
        correo: json['correo']);
  }
}
