// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
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
        body: ListView(children: [
          Text(recipe.name),
          Text("${recipe.coffeeVolumeGrams}"),
          Text("${recipe.waterVolumeGrams}"),
          Padding(
            padding: EdgeInsets.only(top: 8, left: 23, right: 23),
            child: Column(
              children: [
                for (RecipeStep step in recipe.steps)
                  Padding(
                      padding: EdgeInsets.all(6),
                      child: ListTile(
                        title: Text(
                          step.text,
                          style: TextStyle(
                              color: Color(0xff4C748B),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(color: Color(0xff4C748B), width: 1),
                            borderRadius: BorderRadius.circular(10.0)),
                        trailing: Text(
                          step.time.toString(),
                          style: TextStyle(
                              color: Color(0xff4C748B),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        dense: true,
                        visualDensity: VisualDensity(vertical: -3),
                      )),
                Padding(padding: EdgeInsets.all(25)),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: SizedBox(width: 310, height: 50,
                    child: RaisedButton(
                      child: Text("Start", style: TextStyle(color:Colors.white)),
                      color: Color(0xff4C748B),  
                      shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(color: Color(0xff4C748B), width: 1),
                              borderRadius: BorderRadius.circular(10.0)),
                      
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecipeStepsScreen(recipe)),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
