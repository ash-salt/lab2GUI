

import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:provider/provider.dart';

class IngredientControl extends StatelessWidget {
  const IngredientControl({super.key});

  @override
  Widget build(BuildContext context) {

    const labels = MainIngredient.labels;
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
    

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Ingrediens:'),
        SizedBox(width: AppTheme.paddingSmall),
        DropdownMenu<String>(
          width: 164,
          enableFilter: false, // Disables filtering (prevents typing)
          requestFocusOnTap: false, // Prevents keyboard from opening
          initialSelection: labels[0],
          dropdownMenuEntries: [
            for (int i = 0; i < labels.length; i++)
              DropdownMenuEntry(
                value: labels[i],
                label: labels[i],
                // ignore: prefer_if_null_operators
                leadingIcon:  i!=0? MainIngredient.icon(labels[i]):SizedBox(width: AppTheme.paddingMedium)
              ),
            ],
            onSelected: (value){
              recipeHandler.setMainIngredient(value);
            },
          ),
          SizedBox(width: AppTheme.paddingLarge)
        ]
    );


  }
}

