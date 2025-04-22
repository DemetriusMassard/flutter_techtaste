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
              bagProvider.dishesOnBag.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "O carrinho ainda está vazio :(",
                        style: TextStyle(
                            fontSize: 22, color: AppColors.secondaryTextColor),
                      ),
                    )
                  : Column(
                      spacing: 12,
                      children: List.generate(
                        bagProvider.getMapByAmmount().keys.length,
                        (index) {
                          Dish dish = bagProvider
                              .getMapByAmmount()
                              .keys
                              .toList()[index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.lightBackgroundColor),
                              child: SizedBox(
                                height: 80,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 1,
                                        child: _getDishImage(dish.imagePath),
                                      ),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 14),
                                          child: Column(
                                            spacing: 8,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                dish.name,
                                                style: TextStyle(
                                                  color:
                                                      AppColors.mainTextColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                "R\$ ${dish.price.toStringAsFixed(2)}",
                                                style: TextStyle(
                                                  color: AppColors
                                                      .secondaryTextColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 24,
                                              width: 24,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape: const CircleBorder(),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  onPressed: () {
                                                    bagProvider
                                                        .addAllDishes([dish]);
                                                  },
                                                  child: Icon(
                                                    Icons.arrow_drop_up,
                                                    size: 24,
                                                  )),
                                            ),
                                            Text(
                                              bagProvider
                                                  .getMapByAmmount()[dish]
                                                  .toString(),
                                            ),
                                            SizedBox(
                                              height: 24,
                                              width: 24,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape: const CircleBorder(),
                                                    padding: EdgeInsets.zero,
                                                  ),
                                                  onPressed: () {
                                                    bagProvider
                                                        .removeDish(dish);
                                                  },
                                                  child: Icon(
                                                    Icons.arrow_drop_down,
                                                    size: 24,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          );
                          // return ListTile(
                          //   leading: _getDishImage(dish.imagePath),
                          //   title: Text(dish.name),
                          //   subtitle:
                          //       Text("R\$ ${dish.price.toStringAsFixed(2)}"),
                          //   trailing: Row(
                          //     mainAxisSize: MainAxisSize.min,
                          //     children: [
                          //       IconButton(
                          //         onPressed: () {
                          //           bagProvider.removeDish(dish);
                          //         },
                          //         icon: Icon(Icons.remove),
                          //       ),
                          //       Text(
                          //         bagProvider
                          //             .getMapByAmmount()[dish]
                          //             .toString(),
                          //         style: TextStyle(fontSize: 18),
                          //       ),
                          //       IconButton(
                          //         onPressed: () {
                          //           bagProvider.addAllDishes([dish]);
                          //         },
                          //         icon: Icon(Icons.add),
                          //       ),
                          //     ],
                          //   ),
                          // );
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

Image _getDishImage(String imagePath) {
  Image imjObj;
  imjObj = Image.asset(
    'lib/assets/dishes/Salada (1).png',
    fit: BoxFit.fitHeight,
  );
  return imjObj;
}
