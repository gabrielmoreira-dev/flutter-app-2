import 'package:app2_meals/view/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(String title, Icon icon, Function handleOnTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: handleOnTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cooking up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildListTile(
            'Meals',
            Icon(
              Icons.restaurant,
              size: 26,
            ),
            () => Navigator.of(context).pushNamed('/'),
          ),
          _buildListTile(
            'Filters',
            Icon(
              Icons.settings,
              size: 26,
            ),
            () => Navigator.of(context).pushNamed(FiltersScreen.routeName),
          ),
        ],
      ),
    );
  }
}
