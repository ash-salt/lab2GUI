import 'package:flutter/material.dart';
import 'package:lab2/pages/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(children: [_controlPanel(context), _recipeArea(context)]),
      )
    );
  }

  Widget _controlPanel(context, {double width = 320}) {
    return Container(
        width: width,
        color: const Color.fromARGB(255, 193, 210, 218),
        child: Column(children: [Text("Receptsök"), Text("Hitta ett recept som passar dig genom att ändra inställningarna nedanför")])
    );
  }

  Widget _recipeArea(context) {
    return Expanded(
        child: Container(color: const Color.fromARGB(255, 204, 216, 176)),
    );
  }
}
