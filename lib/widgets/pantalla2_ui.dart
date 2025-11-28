import 'package:flutter/material.dart';

class Pantalla2UI extends StatelessWidget {
  final String nombre;
  final int edad;
  final double pesoKg;
  final int entrenamientosPorSemana;
  final String planComidas;
  final String recomendaciones;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const Pantalla2UI({
    required this.nombre,
    required this.edad,
    required this.pesoKg,
    required this.entrenamientosPorSemana,
    required this.planComidas,
    required this.recomendaciones,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A2980),
      appBar: AppBar(
        title: Text("Plan de Alimentación"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tarjeta de usuario
            Card(
              color: Colors.white.withOpacity(0.1),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.person, size: 40, color: Colors.blue),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nombre,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "$edad años • ${pesoKg.toStringAsFixed(1)} kg",
                            style: TextStyle(color: Colors.white70),
                          ),
                          Text(
                            "$entrenamientosPorSemana días/semana",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            
            // Plan de comidas
            Text(
              "Plan de Alimentación",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.white.withOpacity(0.1),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  planComidas,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            
            // Recomendaciones
            Text(
              "Recomendaciones",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Card(
              color: Colors.white.withOpacity(0.1),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  recomendaciones,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            
            // Botones
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  "Ver Rutina de Ejercicios",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: onBack,
                child: Text(
                  "Volver Atrás",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}