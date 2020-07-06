import 'package:flutter/material.dart';
import 'package:receipe_app/widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = "/filter_screen";

  final Map<String, bool> currentFilters;
  final Function setFilter;

  FilterScreen(this.currentFilters, this.setFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
      {String title,
      String description,
      bool currentValue,
      Function updateValue}) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.setFilter({
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              });
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            child: Text("Ajust your filters here!",
                style: Theme.of(context).textTheme.title),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                    title: "Gluten Free",
                    description: "Only Gluten Free meals are selected",
                    currentValue: _glutenFree,
                    updateValue: (value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    }),
                _buildSwitchListTile(
                    title: "Vegan",
                    description: "Only Vegan meals are selected",
                    currentValue: _vegan,
                    updateValue: (value) {
                      setState(() {
                        _vegan = value;
                      });
                    }),
                _buildSwitchListTile(
                    title: "Lactose Free",
                    description: "Only Lactose Free meals are selected",
                    currentValue: _lactoseFree,
                    updateValue: (value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    }),
                _buildSwitchListTile(
                    title: "Vegetarian",
                    description: "Only Vegetarian meals are selected",
                    currentValue: _vegetarian,
                    updateValue: (value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
