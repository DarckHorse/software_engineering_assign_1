// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/done_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

class RecipeStepsScreen extends StatefulWidget {
  CoffeeRecipe recipe;

  RecipeStepsScreen(this.recipe);

  @override
  _RecipeStepsScreenState createState() => _RecipeStepsScreenState();
}

class _RecipeStepsScreenState extends State<RecipeStepsScreen> {
  int currentStep;
  List<RecipeStep> remainingSteps;
  int stepTimeRemaining;
  Timer timer;

  @override
  void initState() {
    super.initState();

    int totalSteps = widget.recipe.steps.length;

    currentStep = 0;
    remainingSteps = widget.recipe.steps;

    //set the starting value of the timer
    stepTimeRemaining = widget.recipe.steps[currentStep].time;

    //make timer that ticks every one seconds
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if timer reached zero
      if (stepTimeRemaining < 1) {
        //increase step
        currentStep++;

        //if we finished
        if (currentStep >= totalSteps) {
          //cancel timer
          timer.cancel();

          //navigate to done screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoneScreen()),
          );
        } else {
          //if we did not finish yet
          //adjust the timer
          //reduce the list of remaining steps
          stepTimeRemaining = widget.recipe.steps[currentStep].time;
          remainingSteps = widget.recipe.steps.sublist(currentStep);
          setState(() {});
        }
      } else {
        //adjust time remaining by one
        stepTimeRemaining = stepTimeRemaining - 1;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RecipeStep currentRecipeStep = widget.recipe.steps[currentStep];

    return Scaffold(
      backgroundColor: Color(0xff4C748B),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(40.5),
          ),
          Text(
            "$stepTimeRemaining",
            key: Key('timer-text'),
            style: TextStyle(
                color: Colors.white, fontSize: 96, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.all(21.5),
          ),
          Text(
            "${currentRecipeStep.text}",
            key: Key('current-step-text'),
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          Padding(
              padding: EdgeInsets.only(top: 22, left: 23),
              child: Text(
                "Steps",
                key: Key('steps-text'),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )),
          Padding(
              padding: EdgeInsets.only(top: 8, left: 23, right: 23),
              child: Column(children: [
                for (RecipeStep step in remainingSteps)
                  (step == remainingSteps[0])
                      ? ListTile(
                          title: Text(
                            step.text,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: Text(
                            CoffeeData.secToTime(step.time),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          visualDensity: VisualDensity(vertical: -3),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(10.0)),
                        )
                      : ListTile(
                          title: Text(
                            step.text,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: Text(
                            CoffeeData.secToTime(step.time),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          visualDensity: VisualDensity(vertical: -3),
                        )
              ]))
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
