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
    super.key,
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
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Plan de dieta y tips'),
        backgroundColor: Colors.black.withOpacity(0.3),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A2980), Color(0xFF26D0CE)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Card(
                  color: Colors.black.withOpacity(0.45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_circle,
                          size: 40,
                          color: colorScheme.secondary,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nombre,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Edad: $edad  •  Peso: ${pesoKg.toStringAsFixed(1)} kg\n"
                                "Entrenos/semana: $entrenamientosPorSemana",
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView(
                    children: [
                      _seccion(
                        icon: Icons.restaurant_menu,
                        titulo: "Plan de comidas sugerido",
                        contenido: planComidas,
                      ),
                      const SizedBox(height: 12),
                      _seccion(
                        icon: Icons.tips_and_updates_outlined,
                        titulo: "Recomendaciones generales",
                        contenido: recomendaciones,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.secondary,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 4,
                  ),
                  child: const Text(
                    "Ver rutina de ejercicios →",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                TextButton(
                  onPressed: onBack,
                  style: TextButton.styleFrom(foregroundColor: Colors.white70),
                  child: const Text("← Editar datos"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _seccion({
    required IconData icon,
    required String titulo,
    required String contenido,
  }) {
    return Card(
      color: Colors.black.withOpacity(0.45),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white70),
                const SizedBox(width: 8),
                Text(
                  titulo,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              contenido,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
