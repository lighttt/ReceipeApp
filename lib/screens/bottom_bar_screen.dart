import 'package:flutter/material.dart';
import 'package:receipe_app/screens/category_overview_screen.dart';
import 'package:receipe_app/widgets/app_drawer.dart';

import 'favourites_screen.dart';

class BottomBarScreen extends StatefulWidget {
  static const String routeName = "/bottom_bar_screen";

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoryOverviewScreen(),
      'title': "Categories",
    },
    {
      'page': FavouritesScreen(),
      'title': "Favourites",
    }
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black45,
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              title: Text("Categories"),
              icon: Icon(Icons.category)),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              title: Text("Favourites"),
              icon: Icon(Icons.favorite))
        ],
      ),
    );
  }
}
