import 'package:flutter/material.dart';
import '../widgets/pantalla2_ui.dart';
import 'pantalla3.dart';

class Pantalla2 extends StatelessWidget {
  final String nombre;
  final int edad;
  final double pesoKg;
  final int entrenamientosPorSemana;

  const Pantalla2({
    super.key,
    required this.nombre,
    required this.edad,
    required this.pesoKg,
    required this.entrenamientosPorSemana,
  });

  String _generarPlanComidas() {
    // Súper simple: solo ejemplos generales, no es asesoría médica
    if (entrenamientosPorSemana >= 5) {
      return "Objetivo: Ganar masa muscular de manera controlada.\n\n"
          "• Desayuno: Avena con leche, plátano y proteína en polvo.\n"
          "• Comida: Pechuga de pollo, arroz, verduras.\n"
          "• Cena: Pescado o pollo con ensalada y algo de carbohidrato (papa/arroz).\n"
          "• Snacks: Yogur griego, frutos secos, fruta.\n";
    } else if (entrenamientosPorSemana >= 3) {
      return "Objetivo: Recomendación general para recomposición y salud.\n\n"
          "• Desayuno: Huevos con verduras y tortilla o pan integral.\n"
          "• Comida: Carne magra (pollo/res) con arroz/pasta y ensalada.\n"
          "• Cena: Algo ligero: atún, ensalada, sándwich integral.\n"
          "• Snacks: Fruta, yogurt, puñado pequeño de nueces.\n";
    } else {
      return "Objetivo: Hábitos saludables básicos.\n\n"
          "• Evita bebidas azucaradas y exceso de comida chatarra.\n"
          "• Come proteína en cada comida (huevo, pollo, atún, frijoles).\n"
          "• Mucha agua durante el día.\n"
          "• Incluye verduras al menos 1–2 veces al día.\n";
    }
  }

  String _generarRecomendaciones() {
    final String nivel = entrenamientosPorSemana >= 5
        ? "alto"
        : (entrenamientosPorSemana >= 3 ? "medio" : "bajo");

    return "Con $entrenamientosPorSemana entrenamientos por semana tu nivel de actividad es $nivel.\n\n"
        "Recomendaciones generales:\n"
        "• Duerme 7–9 horas por noche.\n"
        "• Bebe al menos 2L de agua al día (más si sudas mucho).\n"
        "• Calienta 5–10 minutos antes de entrenar y estira al finalizar.\n"
        "• Lleva un registro simple de tus entrenos (peso, reps, cómo te sentiste).\n"
        "• Aumenta el peso o la intensidad poco a poco.\n\n"
        "Esto es solo una guía general, no sustituye asesoría profesional.";
  }

  @override
  Widget build(BuildContext context) {
    void irAPantalla3() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => Pantalla3(
            nombre: nombre,
            entrenamientosPorSemana: entrenamientosPorSemana,
          ),
        ),
      );
    }

    void regresarPantalla1() {
      Navigator.pop(context);
    }

    final planComidas = _generarPlanComidas();
    final recomendaciones = _generarRecomendaciones();

    return Pantalla2UI(
      nombre: nombre,
      edad: edad,
      pesoKg: pesoKg,
      entrenamientosPorSemana: entrenamientosPorSemana,
      planComidas: planComidas,
      recomendaciones: recomendaciones,
      onNext: irAPantalla3,
      onBack: regresarPantalla1,
    );
  }
}
