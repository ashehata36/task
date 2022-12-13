import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:task1/data/controllers/products_controllers/products_controller.dart';
import 'package:task1/presentation/widgets/location_card.dart';
import 'package:task1/utilities/resources/color_manager.dart';
import 'package:task1/utilities/resources/font_manager.dart';
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
                                                  fontSize: FontSize.s12,
                                                ),
                                              ),
                                              Text(
                                                "${e.unitOfQuantity} ${e.quantity * e.count}",
                                                style: Get.textTheme.titleMedium!.copyWith(
                                                  fontSize: FontSize.s10,
                                                ),
                                              ),
                                              Text(
                                                "${e.iPrice * e.count} \$",
                                                style: Get.textTheme.titleLarge!.copyWith(
                                                  fontSize: FontSize.s16,
                                                  color: ColorManager.primary,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: AppSize.s40,
                                                  width: AppSize.s40,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(
                                                        AppSize.s14,
                                                      ),
                                                      color: const Color(0xffb0eafd)),
                                                  child: const Icon(
                                                    FontAwesomeIcons.minus,
                                                    color: Color(0xff48b6da),
                                                  ),
                                                ),
                                                onTap: () => productsController.minus(id: e.id),
                                              ),
                                              const SizedBox(width: AppSize.s12),
                                              Text(
                                                "${e.count}",
                                                style: Get.textTheme.titleLarge!
                                                    .copyWith(color: ColorManager.grey, fontSize: FontSize.s18),
                                              ),
                                              const SizedBox(width: AppSize.s12),
                                              GestureDetector(
                                                onTap: () => productsController.plus(id: e.id),
                                                child: Container(
                                                  height: AppSize.s40,
                                                  width: AppSize.s40,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(
                                                      AppSize.s14,
                                                    ),
                                                    color: const Color(0xffb0eafd),
                                                  ),
                                                  child: const Icon(
                                                    FontAwesomeIcons.plus,
                                                    color: Color(0xff48b6da),
                                                  ),
                                                ),
                                              ),
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
