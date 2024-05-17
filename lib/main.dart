import 'package:flutter/material.dart';
import 'package:myhealthapp/SRC/feature/screens/age_screen.dart';
import 'package:myhealthapp/SRC/feature/screens/bmi_screen.dart';
import 'package:myhealthapp/SRC/routes/my_health__app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MyHealthAppRouter.router,
      debugShowCheckedModeBanner: false, 
   );
  }
}
