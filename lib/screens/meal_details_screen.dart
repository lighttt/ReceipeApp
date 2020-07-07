import 'package:flutter/material.dart';
import 'package:receipe_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String routeName = "/meal_details_screen";

  final Function toggleFavourite;
  final Function isMealFavourite;

  MealDetailsScreen(this.toggleFavourite, this.isMealFavourite);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    Widget _buildTitle(String title) {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget _buildSection(List<String> sectionList) {
      return Container(
        height: 200,
        width: 300,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: ListView.builder(
          itemBuilder: (ctx, index) => Column(
            children: <Widget>[
              ListTile(
                  leading: CircleAvatar(
                    child: Text("# ${index + 1}"),
                  ),
                  title: Text(sectionList[index])),
              Divider(
                thickness: 3,
              )
            ],
          ),
          itemCount: sectionList.length,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildTitle("Ingredients"),
            _buildSection(selectedMeal.ingredients),
            _buildTitle("Steps"),
            _buildSection(selectedMeal.steps),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isMealFavourite(id)
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border),
        onPressed: () {
          toggleFavourite(id);
        },
      ),
    );
  }
}
