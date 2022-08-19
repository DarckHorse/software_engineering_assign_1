// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

class RecipeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(24.5)),
          Text(
            "Coffee Recipes",
            key: Key("coffee-recipes-text"),
            style: TextStyle(
              color: Color(0xff4C748B),
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.all(8)),
          RecipeList(),
          Padding(padding: EdgeInsets.all(15)),
          Text(
            "Resources",
            key: Key("resources-text"),
            style: TextStyle(
              color: Color(0xff4C748B),
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.all(8)),
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
              Column(
                children: [
                 Container(                    
                    height: 1,
                    child: Divider(
                      color: Color(0xFF4C748B),
                      thickness: 1,
                    ),
                  ),
                  ListTile(
                      title: Text(recipe.name,
                          style: TextStyle(
                              color: Color(0xff4C748B),
                              fontWeight: FontWeight.w400,
                              fontSize: 17)),
                      trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
                      
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecipeDetailScreen(recipe)),
                        );
                      }),
                ],
              ),
          ],
        ));
        
  }
}

class ResourceList extends StatelessWidget {
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
            ListTile(
              onTap: () => launch(
                  'https://www.gourmetcoffees.com/?gclid=CjwKCAjwo_KXBhAaEiwA2RZ8hFEFqJHq246wm35UUSFNHXE53Gmintks5Q7QqzNn4_FhWxmNpdsNVhoCi0YQAvD_BwE'),
              title: Text("Coffee",
                  style: TextStyle(
                      color: Color(0xff4C748B),
                      fontWeight: FontWeight.w400,
                      fontSize: 17)),
              trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
            ),
             Container(                    
                    height: 1,
                    child: Divider(
                      color: Color(0xFF4C748B),
                      thickness: 1,
                    ),
                  ),
            ListTile(
              onTap: () => launch(
                  'https://nymag.com/strategist/article/best-coffee-grinders.html'),
              title: Text("Grinders",
                  style: TextStyle(
                      color: Color(0xff4C748B),
                      fontWeight: FontWeight.w400,
                      fontSize: 17)),
              trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
            ),
             Container(                    
                    height: 1,
                    child: Divider(
                      color: Color(0xFF4C748B),
                      thickness: 1,
                    ),
                  ),
            ListTile(
              onTap: () =>
                  launch('https://nypost.com/article/best-tea-kettles/'),
              title: Text("Kettles",
                  style: TextStyle(
                      color: Color(0xff4C748B),
                      fontWeight: FontWeight.w400,
                      fontSize: 17)),
              trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
            ),
             Container(                    
                    height: 1,
                    child: Divider(
                      color: Color(0xFF4C748B),
                      thickness: 1,
                    ),
                  ),
            ListTile(
              onTap: () => launch(
                  'https://www.homegrounds.co/best-pour-over-coffee-makers/'),
              title: Text("Homebrew Dripper",
                  style: TextStyle(
                      color: Color(0xff4C748B),
                      fontWeight: FontWeight.w400,
                      fontSize: 17)),
              trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
            ),
          ],
        ));
  }
}
