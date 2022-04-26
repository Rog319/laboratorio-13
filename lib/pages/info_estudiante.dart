import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InformacionEstudiante extends StatefulWidget {
  String matricula;
  String nombreCompleto;
  String carrera;
  String semestre;
  String telefono;
  String correo;

  InformacionEstudiante(this.matricula, this.nombreCompleto, this.carrera,
      this.semestre, this.telefono, this.correo,
      {Key? key})
      : super(key: key);

  @override
  State<InformacionEstudiante> createState() => _InformacionEstudianteState();
}

class _InformacionEstudianteState extends State<InformacionEstudiante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informacion del Estudiante'),
        backgroundColor: const Color(0xff9B99FF),
      ),
      body: Container(
        width: double.infinity,
        color: const Color(0xffB38BE8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Nombre: " + widget.nombreCompleto,
                  style: const TextStyle(fontSize: 20),
                )),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Matricula: " + widget.matricula,
                    style: const TextStyle(fontSize: 20))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Carrera: " + widget.carrera,
                    style: const TextStyle(fontSize: 20))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Semestre: " + widget.semestre,
                    style: const TextStyle(fontSize: 20))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Telefono: " + widget.telefono,
                    style: const TextStyle(fontSize: 20))),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Text("Correo: " + widget.correo,
                    style: const TextStyle(fontSize: 20))),
          ],
        ),
      ),
    );
  }
}
