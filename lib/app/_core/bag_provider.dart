import 'package:flutter/material.dart';
import 'package:flutter_techtaste/model/dish.dart';

class BagProvider extends ChangeNotifier {
  List<Dish> dishesOnBag = [];

  void addAllDishes(List<Dish> dishesToAdd) {
    dishesOnBag.addAll(dishesToAdd);
    notifyListeners();
  }

  void removeDish(Dish dish) {
    dishesOnBag.remove(dish);
    notifyListeners();
  }

  void clearBag() {
    dishesOnBag.clear();
    notifyListeners();
  }

  Map<Dish, int> getMapByAmmount() {
    Map<Dish, int> mappedBag = {};
    for (Dish dish in dishesOnBag) {
      if (mappedBag[dish] == null) {
        mappedBag[dish] = 1;
      } else {
        mappedBag[dish] = mappedBag[dish]! + 1;
      }
    }
    return mappedBag;
  }
}
