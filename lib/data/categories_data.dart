import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/category.dart';

class CategoriesData extends ChangeNotifier {
  List<Category> listCategories = [];

  Future<void> getCategories() async {
    String jsonString =
        await (rootBundle.loadString('lib/assets/categories.json'));
    Map<String, dynamic> data = json.decode(jsonString);
    List<dynamic> categoriesData = data['categories'];

    for (var newCategory in categoriesData) {
      Category category = Category.fromMap(newCategory);
      listCategories.add(category);
    }
  }
}
