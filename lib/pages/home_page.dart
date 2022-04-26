import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laboratorio_13/pages/info_estudiante.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_final_fields
  List estudiantes = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => leerJson(context));
  }

  Future<void> leerJson(BuildContext context) async {
    final String datosLeidos =
        await rootBundle.loadString('assets/estudiantes.json');
    final datosDecodificados = await json.decode(datosLeidos);
    setState(() {
      estudiantes = datosDecodificados["Estudiante"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estudiantes'),
        backgroundColor: const Color(0xff9B99FF),
      ),
      body: Container(
        color: const Color(0xffB38BE8),
        child: ListView.builder(
          itemBuilder: ListaEstudiantes,
          itemCount: estudiantes.length,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ListaEstudiantes(context, index) {
    return ListTile(
      title: Text(estudiantes[index]["nombreCompleto"],
          style: const TextStyle(fontSize: 20)),
      subtitle: Text("Matricula: " + estudiantes[index]["matricula"]),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InformacionEstudiante(
                estudiantes[index]["matricula"],
                estudiantes[index]["nombreCompleto"],
                estudiantes[index]["carrera"],
                estudiantes[index]["semestre"],
                estudiantes[index]["telefono"],
                estudiantes[index]["correo"]),
          ),
        );
      },
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
