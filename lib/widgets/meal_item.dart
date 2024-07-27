import 'package:flutter/material.dart';

import 'package:foodies_hub/models/meal.dart';
import 'package:foodies_hub/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget{
  
  const MealItem({super.key, required this.meal, required this.onSelectMeal});
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 10,
      child: InkWell(
      onTap: () {
        onSelectMeal(meal);
      },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                  height:200,
                width: double.infinity,
                fadeInDuration:const Duration(milliseconds: 300),

              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 44),
                  child: Column(
                   children: [
                     Text(
                       meal.title,
                       maxLines: 2,
                       textAlign: TextAlign.center,
                       softWrap: true,
                       overflow: TextOverflow.ellipsis,
                       style: const TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 20,
                         color: Colors.white,
                       ),
                     ),
                     const SizedBox(height: 12,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                       MealItemTrait(
                           icon: Icons.work,
                           label: '${meal.duration} min'
                       ),
                       MealItemTrait(
                           icon: Icons.work,
                           label: complexityText
                       ),
                       MealItemTrait(
                           icon: Icons.attach_money,
                           label: affordabilityText
                       ),
                       // This row does not need expanded as it is already inside
                       // Column widget which is inside positioned(from left, right)
                     ],),
                   ]
                  ),
                ),
            ),
          ],
        ),
    ),
    );
  }

}
