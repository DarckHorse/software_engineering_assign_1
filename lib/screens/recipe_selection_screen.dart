// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

class RecipeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Selection"),
      ),
      body: ListView(
        children: [
          Text("Coffee Recipes", key: Key("coffee-recipes")),
          RecipeList(),
          Text("Resources"),
          ResourceList()
        ],
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          border: Border.all(
            color: Color(0xff4C748B),
            width: 3,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            for (CoffeeRecipe recipe in recipes)
              ListTile(
                  title: Text(recipe.name,
                      style: TextStyle(
                          color: Color(0xff4C748B),
                          fontWeight: FontWeight.w500,
                          fontSize: 17)),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipeDetailScreen(recipe)),
                    );
                  }),
          ],
        ));
  }
}

class ResourceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("Coffee"),
          trailing: Icon(Icons.chevron_right),
        )
      ],
    );
  }
}
