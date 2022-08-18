import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid recipe step', () {
    //make a recipe step

    //check that it has the right data
  });

  group("Reject Null Input", () {
    test('rejects null input for time in step', () {
      expect(() => RecipeStep('step', null), throwsArgumentError);
    });

    test('rejects null input for text in step', () {
      expect(() => RecipeStep(null, 1), throwsArgumentError);
    });
  });

  group("Reject invalid Input", () {
    test('rejects non-natural number input for time in step', () {
      expect(() => RecipeStep('step', 0), throwsArgumentError);
      expect(() => RecipeStep('step', -1), throwsArgumentError);
    });

    test('rejects empty string input for text in step', () {
      expect(() => RecipeStep("", 1), throwsArgumentError);
    });
  });
}
