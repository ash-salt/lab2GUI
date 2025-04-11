import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';



class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);
    return Column(
      
      children: [
        IconButton(
          alignment: Alignment.topRight,
          icon: Icon(Icons.close),
          onPressed: () {
            uiController.deselectRecipe();
          },
        ),
        Row(
          children: [

          ],
        )
      ]
    );
  }





  /*
  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Row(
      spacing: 30,
      children: [
        SizedBox(width: 20),
        SizedBox(height: 250, width: 250, child: recipe.image), 
        Text(recipe.name), 
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            uiController.deselectRecipe();
          },
        )
      ]
    );
  } 
  */
}