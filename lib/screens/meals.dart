import 'package:flutter/material.dart';
import 'package:foodies_hub/main.dart';
import 'package:foodies_hub/models/meal.dart';
import 'package:foodies_hub/screens/meals_details.dart';
import 'package:foodies_hub/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget{
  const MealsScreen({super.key,this.title, required this.meals});
  void selectedMeal(BuildContext context, Meal meal){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx)=>MealsDetails(meals: meal))
    );
  }

  final String? title;
  final List<Meal> meals;
  // final void Function(Meal meals) onToggleFavourite;
  @override
  Widget build(BuildContext context) {
    Widget content =  ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return Text(meals[index].title);
      },
    );
    if(meals.isEmpty){
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:  [
            Text(" OH uh, nothing here" ,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground ),),
            const SizedBox(height: 16,),
            Text('Try selecting a different category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground ),),
          ],
        ),
      );
    }
    if(meals.isNotEmpty){
      content =  ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return
            InkWell(
                child: MealItem(meal: meals[index],
                  onSelectMeal:(meal){
                  selectedMeal(context, meal);
          },)
          );
        },
      );
    }
    if(title==null){
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }

}