import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/data/controllers/products_controllers/products_controller.dart';
import 'package:task1/domain/models/product_model/product_model.dart';
import 'package:task1/utilities/resources/color_manager.dart';
import 'package:task1/utilities/resources/font_manager.dart';
import 'package:task1/utilities/resources/values_manager.dart';

class GroceryDealCard extends StatefulWidget {
  final Product product;

  const GroceryDealCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<GroceryDealCard> createState() => _GroceryDealCardState();
}

class _GroceryDealCardState extends State<GroceryDealCard> {
  final ProductsController productsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppPadding.p14),
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
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    const SizedBox(
                      width: AppSize.s100,
                      height: AppSize.s100,
                    ),
                    Container(
                      padding: const EdgeInsets.all(AppPadding.p1),
                      //margin: const EdgeInsets.all(AppMargin.m4),
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        widget.product.isLiked ? Icons.favorite : Icons.favorite_border,
                        size: AppSize.s18,
                        color: widget.product.isLiked ? ColorManager.primary : ColorManager.grey1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: AppSize.s8),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.title,
                  style: Get.textTheme.titleMedium!.copyWith(
                    fontSize: FontSize.s12,
                  ),
                ),
                Text(
                  "${widget.product.unitOfQuantity} ${widget.product.quantity}",
                  style: Get.textTheme.titleMedium!.copyWith(
                    fontSize: FontSize.s10,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: AppSize.s18,
                      color: ColorManager.grey,
                    ),
                    const SizedBox(width: AppSize.s4),
                    Text(
                      widget.product.location,
                      style: Get.textTheme.titleMedium!.copyWith(
                        fontSize: FontSize.s10,
                      ),
                    ),
                  ],
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      if (widget.product.oldPrice.isNotEmpty)
                        TextSpan(
                          text: "${widget.product.price}  ",
                          style: Get.textTheme.titleLarge!.copyWith(
                            fontSize: FontSize.s16,
                            color: ColorManager.primary,
                          ),
                        ),
                      TextSpan(
                        text: widget.product.oldPrice,
                        style: Get.textTheme.bodyMedium!.copyWith(
                              decoration: TextDecoration.lineThrough,
                              fontSize: FontSize.s12,
                            ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
