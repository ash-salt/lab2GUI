import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/pages/main_view.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/recipe_detail.dart';
import 'package:lab2/widgets/recipe_list.dart';
import 'package:lab2/widgets/time_control.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RecipeHandler()),
        ChangeNotifierProvider(create: (context) => UIController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(children: [_controlPanel(context), RecipeArea()]),
      )
    );
  }

  Widget _controlPanel(context, {double width = 320}) {
    return Container(
        width: width,
        color: const Color.fromARGB(255, 193, 210, 218),
        child: Column(
          children: [
            Text("Receptsök"), 
            Text("Hitta ett recept som passar dig genom att ändra inställningarna nedanför"),
            Row(children: [Text("Ingrediens:"), IngredientControl()]),
            Row(children: [Text("Kök:"), KitchenControl()]),
            SizedBox(child: Text("\nSvårighetsgrad")),
            DifficultyControl(),
            Text("Maxpris"),
            PriceControl(),
            Text("Maxtid"),
            TimeControl(),
          ]
        )
    );
  }
}



class RecipeArea extends StatelessWidget {
  const RecipeArea({super.key});

  @override
  Widget build(BuildContext context) {
    var uiController = context.watch<UIController>();
    Widget contents;

    if (uiController.showRecipeList) {
       contents = RecipeList();
    } else {
       contents = RecipeDetail(uiController.selectedRecipe!);
    }
    return Expanded(child: contents);
  }
}

