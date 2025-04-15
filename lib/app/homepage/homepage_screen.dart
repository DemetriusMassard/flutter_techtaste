import 'package:flutter/material.dart';
import 'package:flutter_techtaste/app/_core/app_colors.dart';
import 'package:flutter_techtaste/app/homepage/widgets/category_widgets.dart';
import 'package:flutter_techtaste/app/homepage/widgets/restaurant_widget.dart';
import 'package:flutter_techtaste/data/categories_data.dart';
import 'package:flutter_techtaste/data/restaurants_data.dart';
import 'package:provider/provider.dart';

import '../../model/restaurant.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantsData restaurantsData = Provider.of<RestaurantsData>(context);
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.account_circle))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              spacing: 32,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'lib/assets/Logo home.png',
                    width: 147,
                  ),
                ),
                Text(
                  "Boas Vindas!",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    color: AppColors.mainTextColor,
                  ),
                ),
                TextFormField(),
                Text(
                  "Escolha por Categoria",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    color: AppColors.mainTextColor,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 22,
                    children: List.generate(
                      CategoriesData.listCategories.length,
                      (index) {
                        return CategoryWidget(
                          category: CategoriesData.listCategories[index],
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    "lib/assets/banners/Banner Tech.png",
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Text(
                  "Bem avaliados",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.mainTextColor,
                  ),
                ),
                Column(
                  spacing: 12,
                  children: List.generate(
                    restaurantsData.listRestaurants.length,
                    (index) {
                      Restaurant restaurant =
                          restaurantsData.listRestaurants[index];
                      return RestaurantWidget(restaurant: restaurant);
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
