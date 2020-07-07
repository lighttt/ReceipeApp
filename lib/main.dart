import 'package:flutter/material.dart';
import 'package:receipe_app/dummy_data.dart';
import 'package:receipe_app/screens/bottom_bar_screen.dart';
import 'package:receipe_app/screens/category_meal_screen.dart';
import 'package:receipe_app/screens/meal_details_screen.dart';

import 'models/meal.dart';
import 'screens/filter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

// setting filters to the dummy meals
  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  // adding or removing meals from favourite list
  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      //favourites ho
      //favourites bata hataunu
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      //not favourites
      //favourites ma add garnu paryo
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  //to know if an item is favourite or not
  bool isMealFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receipe App',
      theme: ThemeData(
          primaryColor: Colors.deepOrange,
          accentColor: Colors.deepOrangeAccent,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(fontSize: 24, fontFamily: "Roboto"))),
      initialRoute: BottomBarScreen.routeName,
      routes: {
        BottomBarScreen.routeName: (ctx) => BottomBarScreen(_favouriteMeals),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters, _setFilter),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_availableMeal),
        MealDetailsScreen.routeName: (ctx) =>
            MealDetailsScreen(_toggleFavourite,isMealFavourite),
      },
    );
  }
}
