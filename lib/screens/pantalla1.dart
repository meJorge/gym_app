import 'package:flutter/material.dart';
import '../widgets/pantalla1_ui.dart';
import 'pantalla2.dart';

class Pantalla1 extends StatefulWidget {
  const Pantalla1({super.key});

  @override
  State<Pantalla1> createState() => _Pantalla1State();
}

class _Pantalla1State extends State<Pantalla1> {
  final TextEditingController nombreCtrl = TextEditingController();
  final TextEditingController edadCtrl = TextEditingController();
  final TextEditingController pesoCtrl = TextEditingController();
  final TextEditingController entrenosCtrl = TextEditingController();

  void _continuar() {
    final nombre = nombreCtrl.text.trim();
    final edadTexto = edadCtrl.text.trim();
    final pesoTexto = pesoCtrl.text.trim();
    final entrenosTexto = entrenosCtrl.text.trim();

    if (nombre.isEmpty ||
        edadTexto.isEmpty ||
        pesoTexto.isEmpty ||
        entrenosTexto.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Completa todos los campos")),
      );
      return;
    }

    final edad = int.tryParse(edadTexto);
    final peso = double.tryParse(pesoTexto.replaceAll(',', '.'));
    final entrenos = int.tryParse(entrenosTexto);

    if (edad == null || edad <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Edad inválida")));
      return;
    }

    if (peso == null || peso <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Peso inválido")));
      return;
    }

    if (entrenos == null || entrenos <= 0 || entrenos > 7) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Entrenamientos por semana debe ser entre 1 y 7"),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Pantalla2(
          nombre: nombre,
          edad: edad,
          pesoKg: peso,
          entrenamientosPorSemana: entrenos,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Pantalla1UI(
      nombreCtrl: nombreCtrl,
      edadCtrl: edadCtrl,
      pesoCtrl: pesoCtrl,
      entrenosCtrl: entrenosCtrl,
      onContinue: _continuar,
    );
  }
}
