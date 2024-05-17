import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myhealthapp/SRC/feature/widgets/my_health_app_drawer.dart';

// Pantalla para determinar el signo zodiacal del usuario basado en su fecha de nacimiento.
class ZodiacScreen extends StatefulWidget {
  @override
  _ZodiacScreenState createState() => _ZodiacScreenState();
}

class _ZodiacScreenState extends State<ZodiacScreen> {
  final TextEditingController _nameController = TextEditingController(); // Controlador para el campo de nombre.
  DateTime? _selectedDate; // Variable para almacenar la fecha de nacimiento seleccionada.
  String? _zodiacSing; // Variable para almacenar el signo zodiacal determinado.

  // Método para mostrar el selector de fecha.
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Fecha inicial del selector: hoy.
      firstDate: DateTime(1900), // Fecha mínima seleccionable.
      lastDate: DateTime.now(), // Fecha máxima seleccionable: hoy.
    ).then((pickedDate) {
      if (pickedDate == null) return; // Si el usuario no selecciona ninguna fecha, salir.
      setState(() {
        _selectedDate = pickedDate; // Actualizar la fecha seleccionada.
        _zodiacSing = _determineZodiacSign(pickedDate); // Determinar el signo zodiacal basado en la fecha seleccionada.
      });
    });
  }

  // Método para determinar el signo zodiacal basado en la fecha de nacimiento.
  String _determineZodiacSign(DateTime date) {
    int day = date.day;
    int month = date.month;
    
    if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
      return "Aries";
    } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
      return "Taurus";
    } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
      return "Gemini";
    } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
      return "Cancer";
    } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
      return "Leo";
    } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
      return "Virgo";
    } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
      return "Libra";
    } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
      return "Scorpio";
    } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
      return "Sagittarius";
    } else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
      return "Capricorn";
    } else if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {                   
      return "Aquarius";                    
    } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {  
      return "Pisces";   
    }
    return "Unknown"; // En caso de que la fecha esté fuera de rango.
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyHealthAppDrawer(), // Drawer personalizado de la aplicación.
      appBar: AppBar(title: Text("Zodiac Sign Calculator")), // Título de la pantalla.
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Espacio alrededor del contenido.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Alinear el contenido al inicio verticalmente.
          children: [
            TextField(
              controller: _nameController, // Asignar controlador para el campo de nombre.
              decoration: InputDecoration(
                labelText: 'Name', // Etiqueta del campo de nombre.
                hintText: 'Enter your name', // Texto de ayuda para el campo de nombre.
                border: OutlineInputBorder(), // Borde del campo de texto.
              ),
            ),
            SizedBox(height: 20), // Espacio vertical entre campos.
            ElevatedButton(
              onPressed: _presentDatePicker, // Acción al presionar el botón: mostrar el selector de fecha.
              child: Text(_selectedDate == null
                     ? 'Pick your birthdate' // Texto del botón si no se ha seleccionado fecha.
                     : 'Change birthdate'), // Texto del botón si ya se ha seleccionado fecha.
            ),
            SizedBox(height: 20), // Espacio vertical entre el botón y el resultado.
            if (_zodiacSing != null) // Mostrar el resultado solo si se ha determinado el signo zodiacal.
              Text(
                'Hello, ${_nameController.text}! Your Zodiac Sign is $_zodiacSing.',
                style: TextStyle(fontSize: 18)), // Texto con el nombre del usuario y su signo zodiacal.
          ],
        ),
      ),
    );
  }
}
