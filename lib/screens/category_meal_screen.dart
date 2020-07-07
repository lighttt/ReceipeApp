import 'package:flutter/material.dart';
import 'package:receipe_app/models/meal.dart';
import 'package:receipe_app/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  static const String routeName = "/meal_screen";

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String title;
  String id;
  List<Meal> categoryMeals;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs = ModalRoute.of(context).settings.arguments as Map;
    title = routeArgs["title"];
    id = routeArgs["id"];
    categoryMeals =
        widget.availableMeals.where((meal) => meal.categories.contains(id)).toList();
    
  }

  @override
  Widget build(BuildContext context) {
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
