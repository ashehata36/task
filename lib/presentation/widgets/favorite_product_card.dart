import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/data/controllers/products_controllers/products_controller.dart';
import 'package:task1/domain/models/product_model/product_model.dart';
import 'package:task1/utilities/resources/color_manager.dart';
import 'package:task1/utilities/resources/font_manager.dart';
import 'package:task1/utilities/resources/values_manager.dart';

class FavoriteProductView extends StatefulWidget {
  final Product product;

  const FavoriteProductView({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<FavoriteProductView> createState() => _FavoriteProductViewState();
}

class _FavoriteProductViewState extends State<FavoriteProductView> {
  final ProductsController productsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p25),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () => productsController.likeProduct(
                id: widget.product.id,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: widget.product.color,
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
                    widget.product.title,
                    style: Get.textTheme.titleMedium!.copyWith(
                      fontSize: FontSize.s16,
                    ),
                  ),
                  Text(
                    widget.product.unitOfQuantity,
                    style: Get.textTheme.titleMedium!.copyWith(
                      fontSize: FontSize.s12,
                      color: ColorManager.grey,
                    ),
                  ),
                  Text(
                    widget.product.price,
                    style: Get.textTheme.titleLarge!.copyWith(
                      fontSize: FontSize.s16,
                      color: ColorManager.primary,
                    ),
                  ),
                  const SizedBox(height: AppSize.s12),
                  if (!widget.product.isInCart)
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
                          style: Get.textTheme.titleMedium!.copyWith(color: ColorManager.white),
                        ),
                      ),
                      onTap: () => productsController.addToCart(product: widget.product),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
