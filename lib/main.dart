import 'package:flutter/material.dart';
import 'package:flutter_techtaste/data/restaurants_data.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //List<Restaurant> listRestaurant = await (RestaurantsData().getRestaurants());
  RestaurantsData restaurantsData = RestaurantsData();
  await (restaurantsData.getRestaurants());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return restaurantsData;
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}
