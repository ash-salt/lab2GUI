import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/widgets/recipe_list_item.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    var recipeHandler = context.watch<RecipeHandler>();
    var recipes = recipeHandler.bestMatches;
    var uiController = Provider.of<UIController>(context, listen: false);
    return ListView(
      children: recipes.map((recipe) {
        return RecipeListItem(recipe, onTap: () {
          if (recipe.name != "Kokande vatten") {
            uiController.selectRecipe(recipe);
          }
          else {
            _launchURL();
          }
        });
      }).toList(),
    );
  }
}


_launchURL() async {
   final Uri _url = Uri.parse('https://www.youtube.com/watch?v=dQw4w9WgXcQ');
   if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
    }
}