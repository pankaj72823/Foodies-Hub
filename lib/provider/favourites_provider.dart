import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodies_hub/models/meal.dart';


class FavouriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavouriteMealsNotifier(): super([]);
  bool toggleMealFavouriteStatus(Meal meal){
    final isMealFavourite = state.contains(meal);
    if(isMealFavourite){
      state = state.where((m)=> m.id!=meal.id).toList();
      return false;
    } else{
      state = [...state,meal];
      return true;
    }
  }
}
final favouriteMealsProvider = StateNotifierProvider<FavouriteMealsNotifier,List<Meal>>((ref) => FavouriteMealsNotifier() );