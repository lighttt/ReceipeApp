import 'package:flutter/material.dart';
import 'package:receipe_app/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  Navigator.push(
        //     context, MaterialPageRoute(builder:(ctx) => CategoryMealScreen()));
        Navigator.pushNamed(context, CategoryMealScreen.routeName,
            arguments: {'title': title});
      },
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
