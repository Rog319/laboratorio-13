import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:laboratorio_13/estudiante.dart';
import 'package:laboratorio_13/pages/info_estudiante.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_final_fields
  List datosEstudiantes = [];
  List<Estudiante> listaEstudiantes = [];

  //Metodo para que leerJson se inicie al inciar la app
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => leerJson(context));
  }

  //Leer y cargar pdf y colocar sus valores en una lista especifica
  Future<void> leerJson(BuildContext context) async {
    final String datosLeidos =
        await rootBundle.loadString('assets/estudiantes.json');
    final datosDecodificados = await json.decode(datosLeidos);
    setState(() {
      datosEstudiantes = datosDecodificados["Estudiante"];
    });

    //Guardar valores del pdf en nuestra lista de tipo "Estudiante"
    for (var i = 0; i < datosEstudiantes.length; i++) {
      listaEstudiantes.add(Estudiante(
          matricula: datosEstudiantes[i]["matricula"],
          nombreCompleto: datosEstudiantes[i]["nombreCompleto"],
          carrera: datosEstudiantes[i]["carrera"],
          semestre: datosEstudiantes[i]["semestre"],
          telefono: datosEstudiantes[i]["telefono"],
          correo: datosEstudiantes[i]["correo"]));
    }
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
          itemCount: datosEstudiantes.length,
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ListaEstudiantes(context, index) {
    return ListTile(
      title: Text(listaEstudiantes[index].nombreCompleto,
          style: const TextStyle(fontSize: 20)),
      subtitle: Text("Matricula: " + listaEstudiantes[index].matricula),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InformacionEstudiante(
                //Mandamos los valores necesarios para info_estudiante
                listaEstudiantes[index].matricula,
                listaEstudiantes[index].nombreCompleto,
                listaEstudiantes[index].carrera,
                listaEstudiantes[index].semestre,
                listaEstudiantes[index].telefono,
                listaEstudiantes[index].correo),
          ),
        );
      },
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
