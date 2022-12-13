import 'package:flutter/material.dart';

class CategoryModel {
  Color color;
  String title;

  CategoryModel({
    required this.title,
    required this.color,
  });
}

class CategoriesModel {
  List<CategoryModel> categories;

  CategoriesModel({
    required this.categories,
  });
}

CategoriesModel dummyCategories = CategoriesModel(
  categories: [
    CategoryModel(
      title: "Steak",
      color: const Color(0xfff9bdad),
    ),
    CategoryModel(
      title: "Vegetables",
      color: const Color(0xfffad96d),
    ),
    CategoryModel(
      title: "Beverages",
      color: const Color(0xffccb8ff),
    ),
    CategoryModel(
      title: "Fish",
      color: const Color(0xffb0eafd),
    ),
    CategoryModel(
      title: "Juice",
      color: const Color(0xffff9dc2),
    ),
  ],
);
