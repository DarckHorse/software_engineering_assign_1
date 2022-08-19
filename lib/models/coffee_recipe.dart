import 'recipe_step.dart';

class CoffeeRecipe {
  String name;
  int coffeeVolumeGrams;
  String grindSize;
  int waterVolumeGrams;
  String miscDetails;
  List<RecipeStep> steps;
  int totalTime = 0;

  CoffeeRecipe(name, coffeeVolumeGrams, waterVolumeGrams, grindSize,
      miscDetails, steps) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts

    if (name == null)
      throw ArgumentError("Invalid name input");
    else if (name == "")
      throw ArgumentError("Invalid name input");
    else
      this.name = name;

    if (coffeeVolumeGrams == null)
      throw ArgumentError("Invalid coffee volume input");
    else if (coffeeVolumeGrams < 1)
      throw ArgumentError("invalid coffee volume input");
    this.coffeeVolumeGrams = coffeeVolumeGrams;

    if (waterVolumeGrams == null)
      throw ArgumentError("Invalid water volume input");
    else if (waterVolumeGrams < 1)
      throw ArgumentError("invalid water volume input");
    this.waterVolumeGrams = waterVolumeGrams;

    if (grindSize == null)
      throw ArgumentError("Invalid grind Size input");
    else if (grindSize == "")
      throw ArgumentError("Invalid grind Size input");
    else
      this.grindSize = grindSize;

    if (miscDetails == null)
      throw ArgumentError("Invalid misc Details input");
    else if (miscDetails == "")
      throw ArgumentError("Invalid misc Details input");
    else
      this.miscDetails = miscDetails;

    if (steps == null)
      throw ArgumentError("Null step input");
    else
      this.steps = steps;

    for (RecipeStep step in steps) {
      totalTime += step.time;
    }
  }
}
