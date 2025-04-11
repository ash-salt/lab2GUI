import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:provider/provider.dart';



class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: 
        Column(
          children: [
            Row(
              mainAxisAlignment : MainAxisAlignment.end,
              crossAxisAlignment : CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    uiController.deselectRecipe();
                  },
                )
              ]
            ),
            Row(
              mainAxisAlignment : MainAxisAlignment.start,
              crossAxisAlignment : CrossAxisAlignment.start,
              children: [
                SizedBox(width: AppTheme.paddingMedium),
                Column(
                  mainAxisAlignment : MainAxisAlignment.start,
                  crossAxisAlignment : CrossAxisAlignment.start,
                  children: [
                    _image(recipe),
                    SizedBox(height: AppTheme.paddingSmall),
                    Text("Ingredienser", style: AppTheme.smallHeading),
                    Text("${recipe.servings} portioner"),
                    SizedBox(height: AppTheme.paddingTiny),
                    for (var ingredient in recipe.ingredients)
                      Row(children: [SizedBox(width: AppTheme.paddingMedium), Text(ingredient.toString())]),
                  ]
                ),
                SizedBox(width: AppTheme.paddingMedium),
                Expanded(
                  child: Column(
                    mainAxisAlignment : MainAxisAlignment.start,
                    crossAxisAlignment : CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(recipe.name, style: AppTheme.mediumHeading),
                      SizedBox(height: AppTheme.paddingSmall),
                      Row(
                        children: [
                          MainIngredient.icon(recipe.mainIngredient) ?? SizedBox(),
                          SizedBox(width: AppTheme.paddingTiny),
                          Difficulty.icon(recipe.difficulty, width: 48) ?? SizedBox(),
                          SizedBox(width: AppTheme.paddingTiny),
                          Text("${recipe.time} minuter"),
                          SizedBox(width: AppTheme.paddingTiny),
                          Text("${recipe.price}kr"),
                        ]
                      ),
                      SizedBox(height: AppTheme.paddingSmall),
                      Text(recipe.description),
                      SizedBox(height: AppTheme.paddingMedium),
                      Text("Tillagning:", style: AppTheme.smallHeading),
                      SizedBox(height: AppTheme.paddingMediumSmall),
                      Text(recipe.instruction),
                    ]
                  ),
                ),
              ],
            )
          ]
        )
    );
  }

  Widget _image(recipe) {
    var square = ClipRect(
      child: Container(
        width: 300, // Square width log(difficulty);
        height: 300, // Square height
        child: FittedBox(fit: BoxFit.cover, child: recipe.image),
      ),
    );

    var flagImage = Cuisine.flag(recipe.cuisine, width: 50.0);

    return Stack(
      children: [square, Positioned(bottom: 16, right: 16, child: flagImage!)],
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