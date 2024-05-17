import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myhealthapp/SRC/feature/widgets/my_health_app_drawer.dart';

// Pantalla para calcular el Índice de Masa Corporal (BMI) del usuario.
class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController _weightController = TextEditingController(); // Controlador para el campo de peso.
  final TextEditingController _heightController = TextEditingController(); // Controlador para el campo de altura.
  double? _bmi; // Variable para almacenar el BMI calculado.
  String? _category; // Variable para almacenar la categoría de BMI.

  // Método para calcular el BMI.
  void _calculateBMI() {
    final double weight = double.tryParse(_weightController.text) ?? 0; // Convertir el peso a doble.
    final double height = double.tryParse(_heightController.text) ?? 0; // Convertir la altura a doble.
    if (weight > 0 && height > 0) { // Validar que los valores ingresados sean positivos.
      final double heightInMeters = height / 100; // Convertir la altura de cm a metros.
      setState(() {
        _bmi = weight / (heightInMeters * heightInMeters); // Calcular el BMI.
        _category = _determineCategory(_bmi!); // Determinar la categoría del BMI.
      });
    }
  }

  // Método para determinar la categoría del BMI basado en el valor calculado.
  String _determineCategory(double bmi) {
    if (bmi < 18.5) return "Underweight"; // Bajo peso.
    else if (bmi < 25) return "Normal"; // Peso normal.
    else if (bmi < 30) return "Overweight"; // Sobrepeso.
    else return "Obese"; // Obesidad.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyHealthAppDrawer(), // Drawer personalizado de la aplicación.
      appBar: AppBar(title: Text("BMI Calculator")), // Título de la pantalla.
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Espacio alrededor del contenido.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Alinear el contenido al inicio verticalmente.
          children: [
            TextField(
              controller: _weightController, // Asignar controlador para el campo de peso.
              keyboardType: TextInputType.number, // Tipo de teclado: solo números.
              decoration: InputDecoration(
                labelText: 'Weight (kg)', // Etiqueta del campo de peso.
                border: OutlineInputBorder(), // Borde del campo de texto.
                hintText: 'Enter your weight in kg' // Texto de ayuda para el campo de peso.
              ),
            ),
            SizedBox(height: 20), // Espacio vertical entre campos.
            TextField(
              controller: _heightController, // Asignar controlador para el campo de altura.
              keyboardType: TextInputType.number, // Tipo de teclado: solo números.
              decoration: InputDecoration(
                labelText: 'Height (cm)', // Etiqueta del campo de altura.
                border: OutlineInputBorder(), // Borde del campo de texto.
                hintText: 'Enter your height in cm' // Texto de ayuda para el campo de altura.
              ),
            ),
            SizedBox(height: 20), // Espacio vertical entre campos.
            ElevatedButton(
              onPressed: _calculateBMI, // Acción al presionar el botón: calcular el BMI.
              child: Text('Calculate BMI'), // Texto del botón.
            ),
            SizedBox(height: 20), // Espacio vertical entre el botón y el resultado.
            if (_bmi != null) // Mostrar el resultado solo si se ha calculado el BMI.
              Text('Your BMI: ${_bmi!.toStringAsFixed(2)} ($_category)', style: TextStyle(fontSize:18)), // Texto con el BMI calculado y su categoría.
          ],
        ),
      ),
    );
  }
}
