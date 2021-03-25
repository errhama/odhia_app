import 'package:flutter/material.dart'; // ce package est obligatoire; pour le design
import './pages/home.dart';
import './pages/login.dart';
import './pages/test.dart';

void main() => runApp(MyApp());
// Statewidget contient un ensemble de widget..

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // pour eliminer un debug sur l'écran
        //Start
        title: "Odhia",
        home: Home(),
        routes: {
          "login": (context) {
            return Login();
          }
        }

        //End
        );
  }
}
