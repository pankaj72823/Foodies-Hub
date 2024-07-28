import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:foodies_hub/provider/filter_provider.dart';

// enum Filter{
//   glutenFree,
//   lactoseFree,
//   vegetarian,
//   vegan,
// }


class FiltersScreen extends ConsumerWidget{
  const FiltersScreen({super.key});


  // void changeFilter(Filter filter, bool value){
  //   final filterNotifier = ref.read(filterProvider.notifier);
  //   filterNotifier.setFilter(filter,value);
  // }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
          children: [
            SwitchListTile(
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (isChecked){
                ref.read(filterProvider.notifier).setFilter(Filter.glutenFree, isChecked);
              },
              title: Text('Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text('Only include Gluten Free Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme  .of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22 ),
            ),
            SwitchListTile(
              value:activeFilters[Filter.lactoseFree]!,
              onChanged: (isChecked){
                ref.read(filterProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
              },
              title: Text('Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text('Only include Lactose Free Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme  .of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22 ),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (isChecked){
                ref.read(filterProvider.notifier).setFilter(Filter.vegetarian, isChecked);
              },
              title: Text('Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text('Only include vegetarian Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme  .of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22 ),
            ),
            SwitchListTile(
              value: activeFilters[Filter.vegan]!,
              onChanged: (isChecked){
                ref.read(filterProvider.notifier).setFilter(Filter.vegan, isChecked);
              },
              title: Text('Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text('Only include vegan Meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme  .of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22 ),
            ),
          ],
        ),
    );
  }

 }

