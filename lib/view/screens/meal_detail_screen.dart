import 'package:app2_meals/data/dummy-data.dart';
import 'package:app2_meals/model/meal.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget _buildTitle(BuildContext context, String title, AppBar appBar) {
    return Container(
      height:
          (MediaQuery.of(context).size.height - appBar.preferredSize.height) *
              0.035,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget _buildContainer(BuildContext context, Widget child, AppBar appBar) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height:
          (MediaQuery.of(context).size.height - appBar.preferredSize.height) *
              0.2,
      width: MediaQuery.of(context).size.width * 0.8,
      child: child,
    );
  }

  Widget _buildIngredientsListView(Meal selectedMeal) {
    return ListView.builder(
      itemCount: selectedMeal.ingredients.length,
      itemBuilder: (context, index) => Card(
        color: Theme.of(context).accentColor,
        child: Padding(
          child: Text(selectedMeal.ingredients[index]),
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
        ),
      ),
    );
  }

  Widget _buildStepsListView(Meal selectedMeal) {
    return ListView.builder(
      itemCount: selectedMeal.steps.length,
      itemBuilder: (context, index) => Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(selectedMeal.steps[index]),
          ),
          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);

    final appBar = AppBar(
      title: Text(selectedMeal.title),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  0.3,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildTitle(context, 'Ingredients', appBar),
            _buildContainer(
              context,
              _buildIngredientsListView(selectedMeal),
              appBar,
            ),
            _buildTitle(context, 'Steps', appBar),
            _buildContainer(
              context,
              _buildStepsListView(selectedMeal),
              appBar,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
          color: Colors.white,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
