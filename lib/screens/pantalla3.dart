import 'package:flutter/material.dart';
import '../widgets/pantalla3_ui.dart';

class DiaRutina {
  final String dia;
  final String titulo;
  final String descripcion;

  DiaRutina({
    required this.dia,
    required this.titulo,
    required this.descripcion,
  });
}

class Pantalla3 extends StatelessWidget {
  final String nombre;
  final int entrenamientosPorSemana;

  const Pantalla3({
    super.key,
    required this.nombre,
    required this.entrenamientosPorSemana,
  });

  List<DiaRutina> _generarRutina() {
    // Siempre mostramos lunes a domingo, marcando descanso cuando toque
    const dias = [
      "Lunes",
      "Martes",
      "Miércoles",
      "Jueves",
      "Viernes",
      "Sábado",
      "Domingo",
    ];

    // base de rutinas según frecuencia
    List<DiaRutina> rutina = [];

    if (entrenamientosPorSemana >= 5) {
      // Push/pull/legs + fuerza + full body
      rutina = [
        DiaRutina(
          dia: "Lunes",
          titulo: "Pecho y tríceps",
          descripcion:
              "Press banca, flexiones, aperturas con mancuernas, fondos en banca, extensión de tríceps.",
        ),
        DiaRutina(
          dia: "Martes",
          titulo: "Espalda y bíceps",
          descripcion:
              "Remo con barra, jalones al pecho, remo mancuerna, curl bíceps barra y mancuernas.",
        ),
        DiaRutina(
          dia: "Miércoles",
          titulo: "Pierna completa",
          descripcion:
              "Sentadillas, press pierna, desplantes, peso muerto rumano, elevación de talones (pantorrilla).",
        ),
        DiaRutina(
          dia: "Jueves",
          titulo: "Hombro y core",
          descripcion:
              "Press militar, elevaciones laterales y frontales, encogimientos, plancha, crunches.",
        ),
        DiaRutina(
          dia: "Viernes",
          titulo: "Full body + cardio ligero",
          descripcion:
              "Circuito de cuerpo completo con poco peso y más repeticiones, 15–20 min de caminata rápida o bici.",
        ),
      ];
    } else if (entrenamientosPorSemana == 4) {
      rutina = [
        DiaRutina(
          dia: "Lunes",
          titulo: "Superior (pecho, espalda, brazos)",
          descripcion:
              "Ejercicios básicos: press banca, remo, jalones, curl bíceps, tríceps polea.",
        ),
        DiaRutina(
          dia: "Martes",
          titulo: "Pierna y core",
          descripcion:
              "Sentadillas, desplantes, peso muerto rumano, press pierna, plancha, crunches.",
        ),
        DiaRutina(
          dia: "Jueves",
          titulo: "Superior (variación)",
          descripcion:
              "Máquinas y mancuernas, énfasis en hombro y espalda alta.",
        ),
        DiaRutina(
          dia: "Sábado",
          titulo: "Pierna ligera + cardio",
          descripcion:
              "Pierna más ligera, trabajo de movilidad y 20–30 min de caminata/bici.",
        ),
      ];
    } else if (entrenamientosPorSemana == 3) {
      rutina = [
        DiaRutina(
          dia: "Lunes",
          titulo: "Full body A",
          descripcion:
              "Sentadilla, press banca, remo, press hombro, curl bíceps, tríceps.",
        ),
        DiaRutina(
          dia: "Miércoles",
          titulo: "Full body B",
          descripcion:
              "Peso muerto rumano, jalones, fondo en banca, elevaciones laterales, core.",
        ),
        DiaRutina(
          dia: "Viernes",
          titulo: "Full body C",
          descripcion:
              "Variación con máquinas y mancuernas, menos peso, más repeticiones.",
        ),
      ];
    } else {
      // 1–2 entrenos
      rutina = [
        DiaRutina(
          dia: "Lunes",
          titulo: "Rutina general",
          descripcion:
              "Cuerpo completo: sentadilla, press banca, remo, hombro, bíceps, tríceps, algo de core.",
        ),
        if (entrenamientosPorSemana == 2)
          DiaRutina(
            dia: "Jueves",
            titulo: "Rutina general 2",
            descripcion:
                "Mismas zonas pero con variaciones en máquinas y mancuernas.",
          ),
      ];
    }

    // rellenar con descansos para los días sin entreno
    final diasUsados = rutina.map((r) => r.dia).toSet();
    for (final d in dias) {
      if (!diasUsados.contains(d)) {
        rutina.add(
          DiaRutina(
            dia: d,
            titulo: "Descanso / actividad ligera",
            descripcion:
                "Caminar, estirar, movilidad articular, nada intenso. Deja que tu cuerpo se recupere.",
          ),
        );
      }
    }

    // mantener orden de lunes a domingo
    rutina.sort((a, b) => dias.indexOf(a.dia).compareTo(dias.indexOf(b.dia)));

    return rutina;
  }

  @override
  Widget build(BuildContext context) {
    void regresarPantalla2() {
      Navigator.pop(context);
    }

    final rutina = _generarRutina();

    return Pantalla3UI(
      nombre: nombre,
      rutina: rutina,
      onBack: regresarPantalla2,
    );
  }
}
