import 'package:flutter/material.dart';
import 'package:flutter_techtaste/app/_core/bag_provider.dart';
import 'package:flutter_techtaste/data/categories_data.dart';
import 'package:flutter_techtaste/data/restaurants_data.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  RestaurantsData restaurantsData = RestaurantsData();
  CategoriesData categoriesData = CategoriesData();
  await (restaurantsData.getRestaurants());
  await (categoriesData.getCategories());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return restaurantsData;
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return categoriesData;
          },
        ),
        ChangeNotifierProvider(create: (context) => BagProvider())
      ],
      child: MyApp(),
    ),
  );
}
