import 'package:app2_meals/view/screens/categories_screen.dart';
import 'package:app2_meals/view/screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Meals());
}

class Meals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.lightBlue,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      //home: CategoriesScreen(),
      title: "Dinameals",
      routes: {
        '/': (_) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(),
      },
    );
  }
}
