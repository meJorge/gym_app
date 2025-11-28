import 'package:flutter/material.dart';
import '../widgets/pantalla1_ui.dart';
import 'pantalla2.dart';

class Pantalla1 extends StatefulWidget {
  const Pantalla1({super.key});

  @override
  State<Pantalla1> createState() => _Pantalla1State();
}

class _Pantalla1State extends State<Pantalla1> {
  final TextEditingController controllerNombre = TextEditingController();
  final TextEditingController controllerEdad = TextEditingController();
  final TextEditingController controllerPeso = TextEditingController();
  final TextEditingController controllerEntrenos = TextEditingController();

  void procesarDatos() {
    String nombre = controllerNombre.text.trim();
    String edadTexto = controllerEdad.text.trim();
    String pesoTexto = controllerPeso.text.trim();
    String entrenosTexto = controllerEntrenos.text.trim();

    if (nombre.isEmpty) {
      mostrarMensajeError("El nombre es requerido");
      return;
    }

    if (edadTexto.isEmpty) {
      mostrarMensajeError("La edad es requerida");
      return;
    }

    if (pesoTexto.isEmpty) {
      mostrarMensajeError("El peso es requerido");
      return;
    }

    if (entrenosTexto.isEmpty) {
      mostrarMensajeError("Los entrenamientos son requeridos");
      return;
    }

    int? edad = int.tryParse(edadTexto);
    if (edad == null || edad < 10 || edad > 100) {
      mostrarMensajeError("Edad debe ser entre 10 y 100 años");
      return;
    }

    double? peso = double.tryParse(pesoTexto);
    if (peso == null || peso < 30 || peso > 300) {
      mostrarMensajeError("Peso debe ser entre 30 y 300 kg");
      return;
    }

    int? entrenos = int.tryParse(entrenosTexto);
    if (entrenos == null || entrenos < 1 || entrenos > 7) {
      mostrarMensajeError("Entrenamientos deben ser entre 1 y 7 por semana");
      return;
    }

    // Todo está bien, navegar a siguiente pantalla
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => Pantalla2(
          nombre: nombre,
          edad: edad,
          pesoKg: peso,
          entrenamientosPorSemana: entrenos,
        ),
      ),
    );
  }

  void mostrarMensajeError(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Pantalla1UI(
      nombreCtrl: controllerNombre,
      edadCtrl: controllerEdad,
      pesoCtrl: controllerPeso,
      entrenosCtrl: controllerEntrenos,
      onContinue: procesarDatos,
    );
  }
}