import 'package:flutter/material.dart';
import 'package:receipe_app/screens/category_meal_screen.dart';
import 'package:receipe_app/screens/category_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receipe App',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        accentColor: Colors.deepOrangeAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
      ),
      home: CategoryOverviewScreen(),
      routes: {
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
      },
    );
  }
}
