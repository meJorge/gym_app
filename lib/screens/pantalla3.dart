import 'package:flutter/material.dart';
import '../widgets/pantalla3_ui.dart';

class DiaRutina {
  String dia;
  String titulo;
  String descripcion;

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
    required this.nombre,
    required this.entrenamientosPorSemana,
  });

  List<DiaRutina> crearRutinaSemanal() {
    var dias = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"];
    var rutina = <DiaRutina>[];

    if (entrenamientosPorSemana >= 5) {
      rutina.add(DiaRutina(
        dia: "Lunes",
        titulo: "Pecho y Tríceps",
        descripcion: "Press banca 4x8-12, Flexiones 3x15, Aperturas 3x12, Fondos 3x10, Extensiones tríceps 3x12"
      ));
      rutina.add(DiaRutina(
        dia: "Martes", 
        titulo: "Espalda y Bíceps",
        descripcion: "Dominadas 4x8, Remo con barra 4x8-12, Jalón al pecho 3x12, Curl bíceps 3x12, Martillo 3x12"
      ));
      rutina.add(DiaRutina(
        dia: "Miércoles",
        titulo: "Piernas",
        descripcion: "Sentadillas 4x8-12, Peso muerto 4x8, Prensa 3x12, Gemelos 4x15, Abductores 3x15"
      ));
      rutina.add(DiaRutina(
        dia: "Jueves",
        titulo: "Hombros y Core",
        descripcion: "Press militar 4x8-12, Elevaciones laterales 3x15, Face pulls 3x15, Plancha 3x1min, Crunches 3x20"
      ));
      rutina.add(DiaRutina(
        dia: "Viernes",
        titulo: "Full Body",
        descripcion: "Circuito: Sentadilla, Press banca, Remo, Press hombro - 4 rondas de 12 repeticiones cada ejercicio"
      ));
    } else if (entrenamientosPorSemana == 4) {
      rutina.add(DiaRutina(
        dia: "Lunes",
        titulo: "Tren Superior",
        descripcion: "Press banca, Remo, Press hombro, Curl bíceps, Extensiones tríceps - 4x8-12 cada uno"
      ));
      rutina.add(DiaRutina(
        dia: "Martes",
        titulo: "Tren Inferior",
        descripcion: "Sentadillas, Peso muerto, Prensa, Gemelos - 4x8-12 cada uno"
      ));
      rutina.add(DiaRutina(
        dia: "Jueves",
        titulo: "Tren Superior",
        descripcion: "Press inclinado, Jalón, Elevaciones laterales, Martillo, Fondos - 3x12-15"
      ));
      rutina.add(DiaRutina(
        dia: "Sábado",
        titulo: "Full Body + Cardio",
        descripcion: "Peso muerto, Press banca, Sentadilla, Core - 3x12 + 20min cardio ligero"
      ));
    } else if (entrenamientosPorSemana == 3) {
      rutina.add(DiaRutina(
        dia: "Lunes",
        titulo: "Full Body A",
        descripcion: "Sentadilla 4x8, Press banca 4x8, Remo 4x8, Plancha 3x1min"
      ));
      rutina.add(DiaRutina(
        dia: "Miércoles",
        titulo: "Full Body B", 
        descripcion: "Peso muerto 4x8, Press hombro 4x8, Jalón 4x8, Crunches 3x15"
      ));
      rutina.add(DiaRutina(
        dia: "Viernes",
        titulo: "Full Body C",
        descripcion: "Prensa 4x10, Flexiones 4x12, Curl bíceps 3x12, Extensiones 3x12, Gemelos 4x15"
      ));
    } else {
      rutina.add(DiaRutina(
        dia: "Lunes",
        titulo: "Full Body Completo",
        descripcion: "Sentadilla 3x10, Press banca 3x10, Remo 3x10, Press hombro 3x10, Curl 3x12, Tríceps 3x12"
      ));
      if (entrenamientosPorSemana == 2) {
        rutina.add(DiaRutina(
          dia: "Jueves",
          titulo: "Full Body Variado",
          descripcion: "Peso muerto 3x8, Flexiones 3x15, Jalón 3x12, Elevaciones 3x15, Plancha 3x1min"
        ));
      }
    }

    // Agregar días de descanso
    for (var dia in dias) {
      bool existe = rutina.any((r) => r.dia == dia);
      if (!existe) {
        rutina.add(DiaRutina(
          dia: dia,
          titulo: "Descanso Activo",
          descripcion: "Descanso o actividad ligera: caminar, estirar, movilidad. Importante para la recuperación muscular."
        ));
      }
    }

    // Ordenar por días de la semana
    rutina.sort((a, b) {
      var orden = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"];
      return orden.indexOf(a.dia).compareTo(orden.indexOf(b.dia));
    });

    return rutina;
  }

  @override
  Widget build(BuildContext context) {
    void volverAtras() {
      Navigator.pop(context);
    }

    var rutina = crearRutinaSemanal();

    return Pantalla3UI(
      nombre: nombre,
      rutina: rutina,
      onBack: volverAtras,
    );
  }
}