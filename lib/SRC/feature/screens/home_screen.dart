import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myhealthapp/SRC/feature/widgets/my_health_app_drawer.dart';

// Pantalla principal de la aplicación con botones para navegar a diferentes funcionalidades.
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyHealthAppDrawer(), // Drawer personalizado de la aplicación.
      appBar: AppBar(
        title: Text('Home Screen'), // Título de la pantalla.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrar el contenido verticalmente.
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.push('/age'), // Navegar a la pantalla de cálculo de edad.
              child: Text('Calculate Age'), // Texto del botón.
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Color de fondo del botón.
                foregroundColor: Colors.white, // Color del texto del botón.
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding del botón.
              ),
            ),
            SizedBox(height: 20), // Espacio vertical entre botones.
            ElevatedButton(
              onPressed: () => context.push('/bmi'), // Navegar a la pantalla de cálculo de BMI.
              child: Text('Calculate BMI'), // Texto del botón.
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Color de fondo del botón.
                foregroundColor: Colors.white, // Color del texto del botón.
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding del botón.
              ),
            ),
            SizedBox(height: 20), // Espacio vertical entre botones.
            ElevatedButton(
              onPressed: () => context.push('/zodiac'), // Navegar a la pantalla de determinación de signo zodiacal.
              child: Text('Determine Zodiac Sign'), // Texto del botón.
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple, // Color de fondo del botón.
                foregroundColor: Colors.white, // Color del texto del botón.
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding del botón.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
