import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:provider/provider.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeHandler = context.watch<RecipeHandler>();
    var recipes = recipeHandler.bestMatches;
    return ListView(
      children: recipes.map((recipe) {
        return ListTile(
          leading: SizedBox(
            width: 50,
            height: 50,
            child: recipe.image,
          ),
          title: Text(recipe.name),
          onTap: () {},
          shape: Border(bottom: BorderSide(color: Colors.black), top: BorderSide(color: Colors.black), right: BorderSide(color: Colors.black), left: BorderSide(color: Colors.black))
        );
      }).toList(),
    );
  }
}