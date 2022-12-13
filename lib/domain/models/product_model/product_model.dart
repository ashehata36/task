import 'package:flutter/material.dart';

class Product {
  int id;
  String title;
  int quantity;
  String unitOfQuantity;
  String location;
  String oldPrice;
  String price;
  Color color;
  bool isLiked;
  bool isInCart;
  int count;
  int iPrice;

  Product({
    required this.id,
    required this.title,
    required this.location,
    required this.oldPrice,
    required this.quantity,
    required this.price,
    required this.color,
    required this.unitOfQuantity,
    required this.isLiked,
    required this.count,
    required this.iPrice,
    required this.isInCart,
  });

  Product copyWith({
    String? title,
    int? quantity,
    String? unitOfQuantity,
    String? location,
    String? oldPrice,
    String? price,
    Color? color,
    bool? isLiked,
    bool? isInCart,
    int? count,
    int? iPrice,
  }) =>
      Product(
        id: id,
        isLiked: isLiked ?? this.isLiked,
        oldPrice: oldPrice ?? this.oldPrice,
        price: price ?? this.price,
        title: title ?? this.title,
        quantity: quantity ?? this.quantity,
        unitOfQuantity: unitOfQuantity ?? this.unitOfQuantity,
        location: location ?? this.location,
        color: color ?? this.color,
        count: count ?? this.count,
        iPrice: iPrice ?? this.iPrice,
        isInCart: isInCart ?? this.isInCart,
      );
}

class Products {
  List<Product> products;

  Products({
    required this.products,
  });
}

Products dummyProducts = Products(
  products: [
    Product(
      id: 1,
      title: "Summer Sun Ice Cream Pack",
      quantity: 5,
      unitOfQuantity: "Pieces",
      price: "\$ 12",
      iPrice: 12,
      location: "15 Minutes Away",
      oldPrice: "\$ 18",
      color: const Color(0xfff9bdad),
      isLiked: false,
      isInCart: false,
      count: 1,
    ),
    Product(
      id: 2,
      title: "Turkish Steak",
      quantity: 173,
      unitOfQuantity: "Grams",
      price: "\$ 25",
      iPrice: 25,
      location: "20 Minutes Away",
      oldPrice: "\$ 30",
      color: const Color(0xfffad96d),
      isLiked: true,
      isInCart: false,
      count: 1,
    ),
    Product(
      id: 3,
      title: "Salmon",
      quantity: 2,
      unitOfQuantity: "Serving",
      price: "\$ 30",
      iPrice: 30,
      location: "20 Minutes Away",
      oldPrice: "",
      color: const Color(0xffccb8ff),
      isLiked: false,
      isInCart: false,
      count: 1,
    ),
    Product(
      id: 4,
      title: "Red Juice",
      quantity: 1,
      unitOfQuantity: "Bottle",
      price: "\$ 25",
      iPrice: 25,
      location: "20 Minutes Away",
      oldPrice: "\$ 35",
      color: const Color(0xffb0eafd),
      isLiked: false,
      isInCart: true,
      count: 1,
    ),
    Product(
      id: 5,
      title: "Cola",
      quantity: 1,
      unitOfQuantity: "Bottle",
      price: "\$ 11",
      iPrice: 11,
      location: "12 Minutes Away",
      oldPrice: "\$ 14",
      color: const Color(0xffff9dc2),
      isLiked: false,
      isInCart: true,
      count: 1,
    ),
  ],
);
