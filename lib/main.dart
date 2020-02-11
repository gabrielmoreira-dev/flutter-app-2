import 'package:app2_meals/data/dummy-data.dart';
import 'package:app2_meals/model/meal.dart';
import 'package:app2_meals/view/screens/filters_screen.dart';
import 'package:app2_meals/view/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

import 'package:app2_meals/view/screens/categories_screen.dart';
import 'package:app2_meals/view/screens/category_meals_screen.dart';
import 'package:app2_meals/view/screens/meal_detail_screen.dart';

void main() {
  runApp(Meals());
}

class Meals extends StatefulWidget {
  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'vegetarian': false,
    'vegan': false,
    'lactoseFree': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['glutenFree'] && !meal.isGlutenFree) return false;
        if (_filters['vegetarian'] && !meal.isVegetarian) return false;
        if (_filters['vegan'] && !meal.isVegan) return false;
        if (_filters['lactoseFree'] && !meal.isLactoseFree) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final index = _favoriteMeals.indexWhere((meal) => mealId == meal.id);
    if (index >= 0) {
      setState(() {
        _favoriteMeals.removeAt(index);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => mealId == meal.id));
      });
    }
  }

  bool _isFavorite(String mealId){
    return _favoriteMeals.any((meal) => mealId == meal.id);
  }

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
        '/': (_) {
          return TabsScreen(_favoriteMeals);
        },
        CategoryMealsScreen.routeName: (_) {
          return CategoryMealsScreen(this._availableMeals);
        },
        MealDetailScreen.routeName: (_) {
          return MealDetailScreen(this._toggleFavorite, this._isFavorite);
        },
        FiltersScreen.routeName: (_) {
          return FiltersScreen(this._filters, this._setFilters);
        },
      },
    );
  }
}
