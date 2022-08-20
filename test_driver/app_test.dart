// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  final coffeeRecipesTextFinder = find.byValueKey("coffee-recipes-text");
  final coffeeRecipeBtnFinder = find.byValueKey("test-recipe");
  final enjoyTextFinder = find.byValueKey("enjoy-text");
  final startBtnFinder = find.byValueKey("start-button");
  final stepsTextFinder = find.byValueKey('steps-text');
  final doneTextFinder = find.byValueKey("done-text");
  final doneBtnFinder = find.byValueKey("done-button");
  final coffeeResourceTextFinder = find.byValueKey("coffee-link");
  final grindersResourceTextFinder = find.byValueKey("grinders-link");
  final kettlesResourceTextFinder = find.byValueKey("kettles-link");
  final dripperResourceTextFinder = find.byValueKey("homebrew-dripper-link");
  final backBtnFinder = find.byValueKey("back-button");

  group('Homebrew Dripper App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final coffeeRecipesTextFinder = find.byValueKey('coffee-recipes-text');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
    });

    test('Make sure recipe follows through to done screen and back', () async {
      // make sure you area on the selection screen
      expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
      // select test recipe
      await driver.tap(coffeeRecipeBtnFinder);
      // make sure youre on the detail screen
      expect(await driver.getText(enjoyTextFinder),
          "It adds a boost of caffeine to your standard coffee experience");
      //tap the start button
      await driver.tap(startBtnFinder);
      //make sure your on the step screen
      expect(await driver.getText(stepsTextFinder), "Steps");
      //wait 25 seconds
      await Future.delayed(const Duration(seconds: 5), () {});
      // make sure youre on the done screen
      expect(await driver.getText(doneTextFinder), "done");
      // tap the done button
      await driver.tap(doneBtnFinder);
      // make sure you area on the selection screen
      expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
    });

    group('resource links', () {
      test('make sure coffee resource link exists', () async {
        // make sure you area on the selection screen
        expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
        // make sure the resource link is there
        expect(await driver.getText(coffeeResourceTextFinder), "Coffee");
      });
      test('make sure grinders resource link exists', () async {
        // make sure you area on the selection screen
        expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
        // make sure the resource link is there
        expect(await driver.getText(grindersResourceTextFinder), "Grinders");
      });
      test('make sure kettles resource link exists', () async {
        // make sure you area on the selection screen
        expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
        // make sure the resource link is there
        expect(await driver.getText(kettlesResourceTextFinder), "Kettles");
      });
      test('make sure homebrew dripper resource link exists', () async {
        // make sure you area on the selection screen
        expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
        // make sure the resource link is there
        expect(await driver.getText(dripperResourceTextFinder),
            "Homebrew Dripper");
      });
    });

    test(
        'make sure the back button form the details screen takes you back to the selection screen',
        () async {
      // make sure im on the selection screen
      expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");

      // tap on a recipe
      await driver.tap(coffeeRecipeBtnFinder);

      // make sure youre on the details screen
      expect(await driver.getText(enjoyTextFinder),
          "It adds a boost of caffeine to your standard coffee experience");

      // tap the back button
      await driver.tap(backBtnFinder);

      // make sure im on the selection screen
      expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
    });


    test('make sure timer counts down', () async {
      // make sure on selection screen
      expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
      // tap recipe
      await driver.tap(coffeeRecipeBtnFinder);
      // make sure youre on the details screen
      expect(await driver.getText(enjoyTextFinder),
          "It adds a boost of caffeine to your standard coffee experience");
      // tap start button
      await driver.tap(startBtnFinder);
      //make sure your on the step screen
      expect(await driver.getText(stepsTextFinder), "Steps");
      // grab timer text
      final timer1TextFinder = find.byValueKey('timer-text');
      expect(await driver.getText(timer1TextFinder), '10');

      // wait 9 sec
      await Future.delayed(const Duration(seconds: 9), () {});
      // grab timer text again
      final timer2TextFinder = find.byValueKey('timer-text');
      expect(await driver.getText(timer2TextFinder), '1');
      });
      
      test('make sure the current step updates and changes', () async {   
      // make sure you are on the selection screen       
      expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");       
      // select test recipe       
      await driver.tap(coffeeRecipeBtnFinder);       
      // make sure youre on the detail screen       
      expect(await driver.getText(enjoyTextFinder),           
      "It adds a boost of caffeine to your standard coffee experience");       
      // tap the start button       
      await driver.tap(startBtnFinder);       
      // make sure your on the step screen       
      expect(await driver.getText(stepsTextFinder), "Steps");       
      // grab the current step       
      final currentStepTextFinder1 = find.byValueKey('current-step-text');       
      // wait 3 seconds       
      await Future.delayed(const Duration(seconds: 3), () {});       
      // grab the current step       
      final currentStepTextFinder2 = find.byValueKey('current-step-text');       
      // compare the 2 current steps       
      expect(currentStepTextFinder1 != currentStepTextFinder2, true);

    });
  });
}
