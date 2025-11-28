import 'package:flutter/material.dart';
import '../widgets/pantalla2_ui.dart';
import 'pantalla3.dart';

class Pantalla2 extends StatelessWidget {
  final String nombre;
  final int edad;
  final double pesoKg;
  final int entrenamientosPorSemana;

  const Pantalla2({
    required this.nombre,
    required this.edad,
    required this.pesoKg,
    required this.entrenamientosPorSemana,
  });

  String generarPlanComidas() {
    if (entrenamientosPorSemana >= 5) {
      return """
OBJETIVO: Ganar masa muscular

DESAYUNO:
- Avena con leche y plátano
- Huevos revueltos (3-4 claras)
- Café o té

COMIDA: 
- Pechuga de pollo o pescado (200g)
- Arroz integral (1 taza)
- Ensalada de verduras

CENA:
- Filete de pescado o pollo
- Verduras al vapor
- Aguacate

SNACKS:
- Yogur griego
- Frutos secos
- Batido de proteína
""";
    } else if (entrenamientosPorSemana >= 3) {
      return """
OBJETIVO: Mantener y tonificar

DESAYUNO:
- Huevos con pan integral
- Fruta
- Café

COMIDA:
- Pollo o pavo
- Pasta o arroz
- Ensalada

CENA:
- Pescado a la plancha
- Verduras
- Queso cottage

SNACKS:
- Fruta
- Nueces
- Yogur
""";
    } else {
      return """
OBJETIVO: Hábitos saludables

- Come cada 3-4 horas
- Incluye proteína en cada comida
- Mucha agua (2-3 litros diarios)
- Evita azúcares y comida procesada
- Frutas y verduras variadas
""";
    }
  }

  String generarRecomendaciones() {
    String nivel;
    if (entrenamientosPorSemana >= 5) {
      nivel = "avanzado";
    } else if (entrenamientosPorSemana >= 3) {
      nivel = "intermedio";
    } else {
      nivel = "principiante";
    }

    return """
Nivel de actividad: $nivel

RECOMENDACIONES:
• Descanso: Duerme 7-9 horas diarias
• Hidratación: 2-3 litros de agua al día
• Calentamiento: 5-10 min antes de entrenar
• Estiramiento: Después de cada sesión
• Progresión: Aumenta pesos gradualmente
• Consistencia: Mejor poco y constante que mucho y abandonar

NOTA: Consulta con profesional para plan personalizado.
""";
  }

  @override
  Widget build(BuildContext context) {
    void irARutinas() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => Pantalla3(
            nombre: nombre,
            entrenamientosPorSemana: entrenamientosPorSemana,
          ),
        ),
      );
    }

    void volverAtras() {
      Navigator.pop(context);
    }

    return Pantalla2UI(
      nombre: nombre,
      edad: edad,
      pesoKg: pesoKg,
      entrenamientosPorSemana: entrenamientosPorSemana,
      planComidas: generarPlanComidas(),
      recomendaciones: generarRecomendaciones(),
      onNext: irARutinas,
      onBack: volverAtras,
    );
  }
}