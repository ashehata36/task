import 'package:flutter/cupertino.dart';
import 'package:task1/presentation/bottom_bar_view/bottom_bar_view.dart';
import 'package:task1/presentation/cart_view/cart_view.dart';
import 'package:task1/presentation/favorites_view/favorites_view.dart';
import 'package:task1/presentation/grocery_view/grocery_view.dart';
import 'package:task1/presentation/news_view/news_view.dart';
import 'package:task1/utilities/routes.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.bottomBarPageRoute:
      return CupertinoPageRoute(
        builder: (_) => BottomBarView(),
        settings: routeSettings,
      );
    case AppRoutes.cartPageRoute:
      return CupertinoPageRoute(
        builder: (_) => CartView(),
        settings: routeSettings,
      );
    case AppRoutes.favoritesPageRoute:
      return CupertinoPageRoute(
        builder: (_) => FavoritesView(),
        settings: routeSettings,
      );
    case AppRoutes.groceryPageRoute:
      return CupertinoPageRoute(
        builder: (_) => GroceryView(),
        settings: routeSettings,
      );
    case AppRoutes.newsPageRoute:
      return CupertinoPageRoute(
        builder: (_) => NewsView(),
        settings: routeSettings,
      );
    default:
      return CupertinoPageRoute(
        builder: (_) => BottomBarView(),
        settings: routeSettings,
      );
  }
}