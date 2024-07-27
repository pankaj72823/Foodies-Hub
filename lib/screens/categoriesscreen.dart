
import 'package:flutter/material.dart';
import 'package:foodies_hub/data/dummy_data.dart';
import 'package:foodies_hub/models/meal.dart';
import 'package:foodies_hub/widgets/category_grid_items.dart';
import 'package:foodies_hub/screens/meals.dart';
import 'package:foodies_hub/models/categories.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  @override
  State<StatefulWidget> createState() {
   return _CategoriesScreen();
  }

  // final void Function(Meal meals) onToggleFavourite;
  final List<Meal>availableMeals;


}

  class _CategoriesScreen extends State<CategoriesScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController  = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


void _selectCategory(BuildContext context, Category category) {
  final filteredMeals = widget.availableMeals.where((meal) =>
      meal.categories.contains(category.id)).toList();
  Navigator.push(
    context, MaterialPageRoute(
      builder: (ctx) =>
          MealsScreen(
            title: category.title,
            meals: filteredMeals,
          )),
  );
}

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController ,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
        children: [
          for(final category in availableCategories)
            CategoryGridItems(category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
    builder: (context,child) => SlideTransition(
      position: Tween(
            begin: Offset(0,0.4),
            end: Offset(0,0),
          ).animate(CurvedAnimation(parent: _animationController, curve: Curves.decelerate)
      ), child: child,),
    );
  }

}