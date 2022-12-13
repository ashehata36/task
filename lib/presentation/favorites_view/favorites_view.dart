import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/data/controllers/products_controllers/products_controller.dart';
import 'package:task1/presentation/widgets/favorite_product_card.dart';
import 'package:task1/presentation/widgets/location_card.dart';
import 'package:task1/utilities/resources/color_manager.dart';
import 'package:task1/utilities/resources/values_manager.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p18,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const LocationCard(location: "Oxford Street"),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorManager.grey),
                            shape: BoxShape.circle,
                          ),
                          child: const SizedBox(
                            width: AppSize.s40,
                            height: AppSize.s40,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: AppSize.s40),
                    ListTile(
                      leading: Text(
                        "Cart",
                        style: Get.textTheme.titleLarge,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p8,
                        vertical: AppPadding.p14,
                      ),
                      child: GetBuilder<ProductsController>(
                        builder: (productsController) => Column(
                          children: productsController.likesProducts.value.products
                              .map(
                                (e) => FavoriteProductView(product: e),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s66),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
