// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

class RecipeDetailScreen extends StatelessWidget {
  CoffeeRecipe recipe;

  RecipeDetailScreen(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(19, 53, 19, 450),
            child: Container(
                height: 164,
                width: 337,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xFF4C748B)),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(children: [
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
                  ),
                ]))),
        Row(
          children: [
            Padding(
                padding: EdgeInsets.only(
                  top: 24,
                  left: 23,
                ),
                child: Text("Steps",
                    style: TextStyle(
                        color: Color(0xff4C748B),
                        fontWeight: FontWeight.w400,
                        fontSize: 17))),
            Spacer(),
            Padding(
                padding: EdgeInsets.only(
                  right: 35,
                  top: 24,
                ),
                child: Text("Total: ${CoffeeData.secToTime(recipe.totalTime)}",
                    style: TextStyle(
                        color: Color(0xff4C748B),
                        fontWeight: FontWeight.w400,
                        fontSize: 17)))
          ],
        ),
        Padding(
            padding: EdgeInsets.only(top: 8, left: 23, right: 23),
            child: Column(children: [
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
                          side: BorderSide(color: Color(0xff4C748B), width: 1),
                          borderRadius: BorderRadius.circular(10.0)),
                      trailing: Text(
                        CoffeeData.secToTime(step.time),
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
                child: SizedBox(
                  width: 310,
                  height: 50,
                  child: RaisedButton(
                    child: Text("Start", style: TextStyle(color: Colors.white)),
                    color: Color(0xff4C748B),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xff4C748B), width: 1),
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
            ]))
      ]),
    );
  }
}
