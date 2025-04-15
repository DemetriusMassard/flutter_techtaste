import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/restaurant.dart';


class RestaurantsData extends ChangeNotifier {
  List<Restaurant> listRestaurants = [];

  Future<void> getRestaurants() async {
    String jsonString = await (rootBundle.loadString('lib/assets/data.json'));
    Map<String, dynamic> data = json.decode(jsonString);
    List<dynamic> restaurantsData = data['restaurants'];

    for (var newRestaurant in restaurantsData) {
      Restaurant restaurant = Restaurant.fromMap(newRestaurant);
      listRestaurants.add(restaurant);
    }
  }
}
