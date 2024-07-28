import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodies_hub/provider/favourites_provider.dart';

import 'package:foodies_hub/screens/categoriesscreen.dart';
import 'package:foodies_hub/screens/filters.dart';
import 'package:foodies_hub/screens/meals.dart';

import 'package:foodies_hub/widgets/main_drawer.dart';

import '../provider/filter_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};
class TabsScreen extends ConsumerStatefulWidget{
  const TabsScreen({super.key});

  
  
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreen();
  }
  
}

class _TabsScreen extends  ConsumerState<TabsScreen>{

  // Map<Filter,bool> selectedFilters = {
  //   Filter.glutenFree: false,
  //   Filter.lactoseFree: false,
  //   Filter.vegetarian: false,
  //   Filter.vegan: false,
  // };

  int _selectedPageIndex = 0;
  // final List<Meal> favourite = [];

  void _setScreen(String identifier) async{
    Navigator.of(context).pop();
    if(identifier=='filters'){
      await Navigator.of(context).push<Map<Filter,bool>>(MaterialPageRoute(
        builder: (ctx)=> const FiltersScreen(),
      ),

      );
    }
    // else{
    //   Navigator.of(context).pop();
    // }
  }
  // void toggleMealFavouriteStatus(Meal meal){
  //   final isExisting = favourite.contains(meal);
  //   setState(() {
  //     if(!isExisting) {
  //       favourite.add(meal);
  //       _showInfoMessage('Marked as a favourite');
  //     }
  //     else{
  //       favourite.remove(meal);
  //       _showInfoMessage('Meal is no longer a favourite ');
  //     }
  //   });
  //
  // }
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // final meals = ref.watch(mealsProvider);
    // final activeFilters = ref.watch(filterProvider);
    final availableMeals =  ref.watch(filteredMealsProvider);


    Widget activePage = CategoriesScreen(availableMeals: availableMeals,);
    var activePageTitle = 'Categories';
    
    if(_selectedPageIndex == 1){
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activePage = MealsScreen(meals: favouriteMeals);
      activePageTitle = 'Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
  
}
