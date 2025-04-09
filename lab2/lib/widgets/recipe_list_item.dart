import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

  

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell( // Nytt
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,
        child: Container(
          height: 128,
          child: Row(
            children: [
              SizedBox(width: AppTheme.paddingSmall),
              _image(recipe),
              SizedBox(width: AppTheme.paddingSmall),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(recipe.name, style: AppTheme.mediumHeading),
                    Text(
                      recipe.description,
                      overflow: TextOverflow.ellipsis, 
                      maxLines: 2
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      MainIngredient.icon(recipe.mainIngredient) ?? SizedBox(), 
                      SizedBox(width: AppTheme.paddingTiny),
                      Difficulty.icon(recipe.difficulty, width: 48) ?? SizedBox(), 
                      SizedBox(width: AppTheme.paddingTiny),
                      Text('${recipe.time} minuter'), 
                      SizedBox(width: AppTheme.paddingSmall),
                      Text('${recipe.price} kr')
                    ])
                  ],
                ),
              ),
              SizedBox(width: AppTheme.paddingSmall),
          ],),
        ),
      ),
    );
  }

 Widget _image(recipe) {
  var square = ClipRect(
    child: Container(
      width: 104, // Square width log(difficulty);
      height: 104, // Square height
      child: FittedBox(fit: BoxFit.cover, child: recipe.image),
    ),
  );

  var flagImage = Cuisine.flag(recipe.cuisine, width: 24.0);

  return Stack(
    children: [square, Positioned(bottom: 8, right: 8, child: flagImage!)],
  );
 }
}


