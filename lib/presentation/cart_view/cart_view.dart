import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/data/controllers/products_controllers/products_controller.dart';
import 'package:task1/presentation/widgets/cart_product_card.dart';
import 'package:task1/presentation/widgets/location_card.dart';
import 'package:task1/utilities/resources/color_manager.dart';
import 'package:task1/utilities/resources/values_manager.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final ProductsController productsController = Get.find();

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
                          children: [
                            ...productsController.productsInCart.value.products
                                .map(
                                  (e) => CartProductCard(product: e),
                                )
                                .toList(),
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.all(AppMargin.m14),
                              padding: const EdgeInsets.symmetric(
                                vertical: AppPadding.p27,
                              ),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/icons/title.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Total Price",
                                    style: Get.textTheme.titleLarge!.copyWith(color: ColorManager.white),
                                  ),
                                  Text(
                                    "${productsController.totalPrice.value}",
                                    style: Get.textTheme.titleLarge!.copyWith(color: ColorManager.white),
                                  )
                                ],
                              ),
                            ),
                          ],
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
