import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  RecipeStep testStep = RecipeStep("step", 5);

  List<RecipeStep> testSteps = [testStep, testStep];

  // CoffeeRecipe testRecipe = new CoffeeRecipe("", -1, 0, "", "", testSteps);
  // CoffeeRecipe nullRecipe =
  //     new CoffeeRecipe(null, null, null, null, null, null);

  test('creates a valid coffee recipe', () {
    //make a coffee recipe

    //check that it has the right data
  });

  //how do we test rejecting invalid coffee recipes?
}
