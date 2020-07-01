import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  static const String routeName = "/meal_screen";

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    final title = routeArgs["title"];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
