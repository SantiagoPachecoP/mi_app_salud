import 'package:go_router/go_router.dart';
import 'package:myhealthapp/SRC/feature/screens/age_screen.dart';
import 'package:myhealthapp/SRC/feature/screens/bmi_screen.dart';
import 'package:myhealthapp/SRC/feature/screens/home_screen.dart';
import 'package:myhealthapp/SRC/feature/screens/zodiac_screen.dart';

class MyHealthAppRouter {
  static GoRouter router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen ()),
    GoRoute(path: '/bmi', builder: (context, state) => BmiScreen()),
    GoRoute(path: '/age', builder: (context, state) => AgeScreen()),
    GoRoute(path: '/zodiac', builder: (context, state) => ZodiacScreen()),
  ]); // GoRouter
}
