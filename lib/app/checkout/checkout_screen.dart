import 'package:flutter/material.dart';
import 'package:flutter_techtaste/app/_core/bag_provider.dart';
import 'package:provider/provider.dart';

import '../../model/dish.dart';
import '../_core/app_colors.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Sacola"),
          centerTitle: true,
          actions: [
            TextButton(
                onPressed: () {
                  bagProvider.clearBag();
                },
                child: Text("Limpar"))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Pedido",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                    color: AppColors.mainTextColor,
                  ),
                ),
                Column(
                  children: List.generate(
                    bagProvider.getMapByAmmount().keys.length,
                    (index) {
                      Dish dish =
                          bagProvider.getMapByAmmount().keys.toList()[index];
                      return ListTile(
                          leading: _getDishImage(dish.imagePath),
                          title: Text(dish.name),
                          subtitle:
                              Text("R\$ ${dish.price.toStringAsFixed(2)}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  bagProvider.removeDish(dish);
                                },
                                icon: Icon(Icons.remove),
                              ),
                              Text(
                                bagProvider.getMapByAmmount()[dish].toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                              IconButton(
                                onPressed: () {
                                  bagProvider.addAllDishes([dish]);
                                },
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

Image _getDishImage(String imagePath) {
  Image imjObj;
  imjObj = Image.asset('lib/assets/dishes/Salada (1).png');
  return imjObj;
}
