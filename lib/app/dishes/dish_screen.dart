import 'package:flutter/material.dart';
import 'package:flutter_techtaste/app/_core/app_colors.dart';
import 'package:flutter_techtaste/app/_core/bag_provider.dart';
import 'package:provider/provider.dart';

import '../../model/dish.dart';
import '../_core/widgets/appbar.dart';

class DishScreen extends StatefulWidget {
  const DishScreen({required this.dish, super.key});

  final Dish dish;
  @override
  State<DishScreen> createState() => _DishScreenState(dish);
}

class _DishScreenState extends State<DishScreen> {
  _DishScreenState(this.dish);

  Dish dish;

  int dishQty = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(context: context, title: dish.name),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'lib/assets/dishes/Salada (1).png',
                fit: BoxFit.fitWidth,
              ),
              Text(
                dish.name,
                style: TextStyle(
                    color: AppColors.mainTextColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "R\$ ${dish.price.toStringAsFixed(2)}",
                style: TextStyle(
                    color: AppColors.secondaryTextColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                dish.description,
                style: TextStyle(
                  color: AppColors.secondaryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(), padding: EdgeInsets.zero),
                    onPressed: increaseDishQty,
                    child: Icon(
                      Icons.arrow_drop_up,
                      size: 32,
                    ),
                  ),
                  Text(
                    dishQty.toString(),
                    style: TextStyle(
                      color: AppColors.secondaryTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(), padding: EdgeInsets.zero),
                    onPressed: decreaseDishQty,
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 32,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: addToBag,
                child: Text("Adicionar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void increaseDishQty() {
    setState(() {
      dishQty++;
    });
  }

  void decreaseDishQty() {
    setState(() {
      dishQty == 0 ? null : dishQty--;
    });
  }

  void addToBag() {
    List<Dish> dishesToAdd = [];
    for (int i = 0; i < dishQty; i++) {
      dishesToAdd.add(dish);
    }
    context.read<BagProvider>().addAllDishes(dishesToAdd);
    setState(() {
      dishQty = 0;
    });
  }
}
