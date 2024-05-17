import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myhealthapp/SRC/feature/widgets/my_health_app_drawer.dart';

// Pantalla que calcula la edad del usuario basado en su fecha de nacimiento seleccionada.
class AgeScreen extends StatefulWidget {
  @override
  _AgeScreenState createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  // Variables para almacenar la fecha seleccionada y la edad calculada.
  DateTime? _selectedDate;
  int? _age;

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
        _age = _calculateAge(pickedDate); // Calcular la edad basada en la fecha seleccionada.
      });
    });
  }

  // Método para calcular la edad basado en la fecha de nacimiento.
  int _calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year; // Calcular la edad preliminar.
    // Ajustar la edad si el cumpleaños aún no ha ocurrido este año.
    if (currentDate.month < birthDate.month ||
       (currentDate.month == birthDate.month &&
           currentDate.day < birthDate.day)) {
            age--; // Restar un año si aún no ha pasado el cumpleaños este año.
      }
      return age;
   }

   @override 
 Widget build(BuildContext context) {
  return Scaffold(
    drawer: MyHealthAppDrawer(), // Drawer personalizado de la aplicación.
    appBar: AppBar(title: Text("Age Calculator")), // Título de la pantalla.
    body: Padding(
      padding: const EdgeInsets.all(20.0), // Espacio alrededor del contenido.
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centrar el contenido verticalmente.
        children: [
          ElevatedButton(
            onPressed: _presentDatePicker, // Acción al presionar el botón: mostrar el selector de fecha.
            child: Text(_selectedDate == null
            ? 'Select your birthdate' // Texto si no se ha seleccionado fecha.
            : 'Change birthdate (${_selectedDate!.toIso8601String().substring(0, 10)})'), // Texto si ya se ha seleccionado fecha.
            ),
            SizedBox(height: 20), // Espacio vertical entre el botón y el texto.
            if (_age != null) // Mostrar la edad solo si ya se ha calculado.
            Text('You are $_age years old.', style: TextStyle(fontSize: 18)), // Texto con la edad calculada.
          ],
        )
      )
     );
   }

}
