import 'package:flutter/material.dart';
import 'package:receipe_app/dummy_data.dart';
import 'package:receipe_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const String routeName = "/meal_screen";

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    final title = routeArgs["title"];
    final id = routeArgs["id"];
    final categoryMeals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => MealItem(
          id: categoryMeals[index].id,
          title: categoryMeals[index].title,
          imageUrl: categoryMeals[index].imageUrl,
          affordability: categoryMeals[index].affordability,
          duration: categoryMeals[index].duration,
          complexity: categoryMeals[index].complexity,
        ),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
