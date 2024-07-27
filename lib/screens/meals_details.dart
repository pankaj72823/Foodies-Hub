import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodies_hub/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:foodies_hub/provider/favourites_provider.dart';

class MealsDetails extends ConsumerWidget{
  const MealsDetails({super.key, required this.meals});
  final Meal meals;

  // final void Function(Meal meals) onToggleFavourite;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final favoriteMeals = ref.watch(favouriteMealsProvider);

    final isFavorite = favoriteMeals.contains(meals);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            final wasAdded = ref.read(favouriteMealsProvider.notifier).toggleMealFavouriteStatus(meals);
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(wasAdded  ? 'Meal added as a favourite': 'Meal removed from favourite'),
            )
            );
          }, icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) {
              return RotationTransition(turns: Tween<double>(
                 begin: 0.8,
                end: 1,
              ).animate(animation),
              child: child,
              );
              },
              child: Icon( isFavorite ? Icons.star : Icons.star_border, key: ValueKey(isFavorite))),),
        ],
        title:Text(meals.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meals.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),

                image: NetworkImage(meals.imageUrl),
                fit: BoxFit.cover,
                height:200,
                width: double.infinity,
                fadeInDuration:const Duration(milliseconds: 300),
              ),
            ),
             const SizedBox(height: 10,),
             Column(
              children: [
                const Text('Ingredients', style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold
                ),
                ),
                for(final item in meals.ingredients)
                  Text(item, style: const TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 10,),
            Column(
              children: [
                const Text('Steps', style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold
                ),
                ),
                for(final item in meals.steps)
                  Text(item, style: const TextStyle(color: Colors.white)),
              ],
            )
          ],
        ),
      ),

    );
  }

}