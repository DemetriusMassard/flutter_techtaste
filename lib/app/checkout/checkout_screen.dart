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
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Pedido",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.mainTextColor,
                ),
              ),
              bagProvider.getMapByAmmount().isEmpty
                  ? Text(
                      "O Carrinho ainda está vazio :(",
                      style: TextStyle(
                        fontSize: 22,
                        color: AppColors.secondaryTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : _buildDishesOnBag(bagProvider),
              Text(
                "Pagamento",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.mainTextColor,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: 80,
                  child: Row(
                    spacing: 16,
                    children: [
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Image.asset(
                          'lib/assets/others/visa.png',
                          height: 32,
                        ),
                      ),
                      Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "VISA Classic",
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "****-0976",
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: SizedBox(
                          width: 24,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {},
                            child: Icon(
                              Icons.chevron_right,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Entregar no endereço:",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.mainTextColor,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: 80,
                  child: Row(
                    spacing: 16,
                    children: [
                      Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Icon(Icons.location_on)),
                      Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Rua Santo Estevão, 960",
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "Apto. 1230",
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: SizedBox(
                          width: 24,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {},
                            child: Icon(
                              Icons.chevron_right,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bagProvider.getMapByAmmount().isEmpty
                  ? SizedBox.shrink()
                  : _buildValueConfirmation(bagProvider, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildValueConfirmation(BagProvider bagProvider, context) {
    return Column(
      children: [
        Text(
          "Confirmar",
          style: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.lightBackgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            spacing: 12,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      "Pedido:",
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      "R\$ ${bagProvider.getCheckoutTotal().toStringAsFixed(2)}",
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      "Frete:",
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      "R\$ ${6.toStringAsFixed(2)}",
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      "Total:",
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      "R\$ ${(bagProvider.getCheckoutTotal() + 6).toStringAsFixed(2)}",
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 18,
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    spacing: 4,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        size: 22,
                      ),
                      Text(
                        "Pedir",
                        style: TextStyle(
                          color: AppColors.backgroundColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  VoidCallback? purchaseConfirmation(context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const Text('AlertDialog description'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
    return null;
  }

  Widget _buildDishesOnBag(BagProvider bagProvider) {
    return Column(
      spacing: 12,
      children: List.generate(
        bagProvider.getMapByAmmount().keys.length,
        (index) {
          Dish dish = bagProvider.getMapByAmmount().keys.toList()[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(color: AppColors.lightBackgroundColor),
              child: SizedBox(
                height: 80,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 2,
                        child: _getDishImage(dish.imagePath),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 14),
                          child: Column(
                            spacing: 8,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dish.name,
                                style: TextStyle(
                                  color: AppColors.mainTextColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "R\$ ${dish.price.toStringAsFixed(2)}",
                                style: TextStyle(
                                  color: AppColors.secondaryTextColor,
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
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () {
                                  bagProvider.addAllDishes([dish]);
                                },
                                child: Icon(
                                  Icons.arrow_drop_up,
                                  size: 24,
                                ),
                              ),
                            ),
                            Text(
                              bagProvider.getMapByAmmount()[dish].toString(),
                            ),
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {
                                    bagProvider.removeDish(dish);
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
        },
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
