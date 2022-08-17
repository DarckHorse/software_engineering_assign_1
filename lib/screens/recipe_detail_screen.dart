// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';

class RecipeDetailScreen extends StatelessWidget {
  CoffeeRecipe recipe;

  RecipeDetailScreen(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Details"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(19, 53, 19, 450),
            child: Container(
              height: 164,
              width: 337,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Color(0xFF4C748B)),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(recipe.name),
                  ),
                  Container(
                    width: 293,
                    child: Divider(
                      color: Color(0xFF4C748B),
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 17),
                    child: Text(
                        "${recipe.coffeeVolumeGrams}g - ${recipe.grindSize}"),
                  ),
                  Text("${recipe.waterVolumeGrams}g - water"),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Text(
                      '${recipe.miscDetails}',
                      key: Key('enjoy-text'),
                      style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF4C748B)),
                    ),
                  )
                ],
              ),
            ),
          ),
          RaisedButton(
            child: Text("Start"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeStepsScreen(recipe)),
              );
            },
          )
        ],
      ),
    );
  }
}
