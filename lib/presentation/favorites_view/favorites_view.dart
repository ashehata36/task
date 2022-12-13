import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:task1/data/controllers/products_controllers/products_controller.dart';
import 'package:task1/presentation/widgets/location_card.dart';
import 'package:task1/utilities/resources/color_manager.dart';
import 'package:task1/utilities/resources/font_manager.dart';
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
                                (e) => Padding(
                                  padding: const EdgeInsets.only(bottom: AppPadding.p25),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        GestureDetector(
                                          onTap: () => productsController.likeProduct(
                                            id: e.id,
                                          ),
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: e.color,
                                              borderRadius: BorderRadius.circular(AppSize.s14),
                                            ),
                                            position: DecorationPosition.background,
                                            child: const SizedBox(
                                              width: AppSize.s66,
                                              height: AppSize.s66,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: AppSize.s12),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e.title,
                                                style: Get.textTheme.titleMedium!.copyWith(
                                                  fontSize: FontSize.s16,
                                                ),
                                              ),
                                              Text(
                                                e.unitOfQuantity,
                                                style: Get.textTheme.titleMedium!.copyWith(
                                                  fontSize: FontSize.s12,
                                                  color: ColorManager.grey,
                                                ),
                                              ),
                                              Text(
                                                e.price,
                                                style: Get.textTheme.titleLarge!.copyWith(
                                                  fontSize: FontSize.s16,
                                                  color: ColorManager.primary,
                                                ),
                                              ),
                                              const SizedBox(height: AppSize.s12),
                                              if (!e.isInCart)
                                                GestureDetector(
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(
                                                          AppSize.s14,
                                                        ),
                                                        color: const Color(0xffb0eafd)),
                                                    child: Text(
                                                      "ADD TO CART",
                                                      style: Get.textTheme.titleMedium!
                                                          .copyWith(color: ColorManager.white),
                                                    ),
                                                  ),
                                                  onTap: () => productsController.addToCart(product: e),
                                                )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
