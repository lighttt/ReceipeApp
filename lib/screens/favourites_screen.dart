import 'package:flutter/material.dart';
import 'package:receipe_app/models/meal.dart';
import 'package:receipe_app/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favourites;
  FavouritesScreen(this.favourites);

  @override
  Widget build(BuildContext context) {
    return favourites.isEmpty
        ? Center(
            child: Text("Add favourites reciepe to show here!"),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) => MealItem(
              id: favourites[index].id,
              title: favourites[index].title,
              imageUrl: favourites[index].imageUrl,
              affordability: favourites[index].affordability,
              duration: favourites[index].duration,
              complexity: favourites[index].complexity,
            ),
            itemCount: favourites.length,
          );
  }
}
