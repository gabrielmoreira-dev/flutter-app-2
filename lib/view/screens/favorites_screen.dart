import 'package:app2_meals/model/meal.dart';
import 'package:app2_meals/view/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Center(
            child: Text(
              'No favorite meals yet',
              style: Theme.of(context).textTheme.title,
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) => MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability,
            ),
            itemCount: favoriteMeals.length,
          );
  }
}
