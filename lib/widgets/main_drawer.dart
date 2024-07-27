import 'package:flutter/material.dart';

import 'package:foodies_hub/screens/categoriesscreen.dart';
import 'package:foodies_hub/models/meal.dart';

import '../models/meal.dart';

class MainDrawer extends StatelessWidget{
  const MainDrawer({super.key, required this.onSelectScreen});



  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primaryContainer,
                      Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                Icon(Icons.fastfood,size: 48, color: Theme.of(context).colorScheme.primary,),
                const SizedBox(width: 20),
                Text('Cooking up', style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),),
                ]
              ),

    ),
          ListTile(

            leading: Icon(Icons.restaurant, color: Theme.of(context).colorScheme.onBackground,),
            title: Text(
                'Meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24,
                )
            ),
            onTap: () {
              onSelectScreen('meal');
               // Navigator.pop(context);
              // Navigator.of(context).push(
              //     MaterialPageRoute(
              //         builder: (ctx)=>CategoriesScreen(onToggleFavourite: onToggleFavourite,))
              // );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.onBackground,),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 24,
              )
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          )
        ],
      ),
    );
  }

}
