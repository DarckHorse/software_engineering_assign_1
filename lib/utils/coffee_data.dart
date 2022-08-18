// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';

CoffeeRecipe makeSweetMariasRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 30),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 15),
    RecipeStep("Cover and wait", 75),
    RecipeStep("Stir", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Sweet Maria's",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeTestRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 05),
    RecipeStep("Cover and wait", 05),
    RecipeStep("Stir", 05),
    RecipeStep("Cover and wait", 05),
    RecipeStep("Stir", 05),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Test Recipe",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeStrongEnoughRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 43g of coarse ground coffee", 30),
    RecipeStep("Add 250g hot but not boiling water", 30),
    RecipeStep("Stir", 05),
    RecipeStep("Cover and wait", 240),
  ];
  CoffeeRecipe recipe = CoffeeRecipe("Strong Enough", 43, 250,
      "coarse ground coffee", "it's bittersweet", steps);
  return recipe;
}

CoffeeRecipe makeEspressoRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 64g of medium-fine ground coffee", 30),
    RecipeStep("Add 125g hot but not boiling water", 30),
    RecipeStep("Cover and wait", 120),
    RecipeStep("Stir", 05),
    RecipeStep("Cover and wait", 120),
    RecipeStep("Stir", 05),
  ];
  CoffeeRecipe recipe = CoffeeRecipe("Espresso", 64, 125,
      "medium-fine ground coffee", "A kickstart to your day", steps);
  return recipe;
}

List<CoffeeRecipe> getAllRecipes() {
  return [
    makeSweetMariasRecipe(),
    makeEspressoRecipe(),
    makeStrongEnoughRecipe(),
    makeTestRecipe(),
  ];
}

class CoffeeData {
  static List<CoffeeRecipe> loadRecipes() {
    return getAllRecipes();
  }

  static String secToTime(int time) {
    int m, s = 0;
    String min, sec;

    m = time ~/ 60;
    s = time - (m * 60);

    min = m.toString().padLeft(2, '0');
    sec = s.toString().padLeft(2, '0');

    if (time <= 0)
      throw ArgumentError("Total time is not valid");
    else
      return "${min}:${sec}";
  }
}
