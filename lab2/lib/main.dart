import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/logo.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: AppTheme.colorScheme,
        textTheme: AppTheme.textTheme,
        
      ),
      home: Scaffold(
        body: Row(children: [_controlPanel(context), RecipeArea()]),
      )
    );
  }

  Widget _controlPanel(context, {double width = 320}) {
    return Container(
      width: width,
      color: const Color.fromARGB(255, 193, 210, 218),
      child: Padding(
        padding: const EdgeInsets.only(left: AppTheme.paddingMedium), // You can replace 16.0 with AppTheme.paddingHuge if desired
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Logo(),
            SizedBox(
              width: width - AppTheme.paddingHuge,
              height: 2 * AppTheme.paddingHuge,
              child: Text(
                "Hitta ett recept som passar dig genom att ändra inställningarna nedanför",
              ),
            ),
            IngredientControl(),
            KitchenControl(),
            SizedBox(height: AppTheme.paddingHuge),
            SizedBox(child: Text("Svårighetsgrad", style: TextStyle(fontWeight: FontWeight.bold))),
            SizedBox(height: AppTheme.paddingTiny),
            DifficultyControl(),
            SizedBox(height: AppTheme.paddingTiny), 
            Text("Maxpris", style: TextStyle(fontWeight: FontWeight.bold)),
            PriceControl(),
            Text("Maxtid", style: TextStyle(fontWeight: FontWeight.bold)),
            TimeControl(),
          ],
        ),
      ),
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

