import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
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
    expect(CoffeeRecipe("name", 1, 1, "fine", "cool", testSteps, "key"),
        isA<CoffeeRecipe>());
  });

  group('rejects null input', () {
    test('for name', () {
      //make a coffee recipe
      expect(() => CoffeeRecipe(null, 1, 1, "fine", "cool", testSteps, "key"),
          throwsArgumentError);
    });

    test('for coffee volume', () {
      //make a coffee recipe
      expect(
          () => CoffeeRecipe("name", null, 1, "fine", "cool", testSteps, "key"),
          throwsArgumentError);
    });

    test('for water volume', () {
      //make a coffee recipe
      expect(
          () => CoffeeRecipe("name", 1, null, "fine", "cool", testSteps, "key"),
          throwsArgumentError);
    });

    test('for ground size', () {
      //make a coffee recipe
      expect(() => CoffeeRecipe("name", 1, 1, null, "cool", testSteps, "key"),
          throwsArgumentError);
    });

    test('for misc details', () {
      //make a coffee recipe
      expect(() => CoffeeRecipe("name", 1, 1, "fine", null, testSteps, "key"),
          throwsArgumentError);
    });

    test('for step list', () {
      //make a coffee recipe
      expect(() => CoffeeRecipe("name", 1, 1, "fine", "cool", null, "key"),
          throwsArgumentError);
    });

    test('for key', () {
      //make a coffee recipe
      expect(() => CoffeeRecipe("name", 1, 1, "fine", "cool", testSteps, null),
          throwsArgumentError);
    });
  });

  group('rejects invalid input', () {
    test('for name', () {
      //make a coffee recipe
      expect(() => CoffeeRecipe("", 1, 1, "fine", "cool", testSteps, "key"),
          throwsArgumentError);
    });

    test('for coffee volume', () {
      //make a coffee recipe
      expect(() => CoffeeRecipe("name", 0, 1, "fine", "cool", testSteps, "key"),
          throwsArgumentError);
      expect(
          () => CoffeeRecipe("name", -1, 1, "fine", "cool", testSteps, "key"),
          throwsArgumentError);
    });

    test('for water volume', () {
      //make a coffee recipe
      expect(() => CoffeeRecipe("name", 1, 0, "fine", "cool", testSteps, "key"),
          throwsArgumentError);
      expect(
          () => CoffeeRecipe("name", 1, -1, "fine", "cool", testSteps, "key"),
          throwsArgumentError);
    });

    test('for ground size', () {
      //make a coffee recipe
      expect(() => CoffeeRecipe("name", 1, 1, "", "cool", testSteps, "key"),
          throwsArgumentError);
    });

    test('for misc details', () {
      //make a coffee recipe
      expect(() => CoffeeRecipe("name", 1, 1, "fine", "", testSteps, "key"),
          throwsArgumentError);
    });

    test('for key', () {
      //make a coffee recipe
      expect(() => CoffeeRecipe("name", 1, 1, "fine", "cool", testSteps, ""),
          throwsArgumentError);
    });
  });
}
