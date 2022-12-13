import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:task1/data/controllers/products_controllers/products_controller.dart';
import 'package:task1/domain/models/product_model/product_model.dart';
import 'package:task1/utilities/resources/color_manager.dart';
import 'package:task1/utilities/resources/font_manager.dart';
import 'package:task1/utilities/resources/values_manager.dart';

class CartProductCard extends StatefulWidget {
  final Product product;

  const CartProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
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
                      fontSize: FontSize.s12,
                    ),
                  ),
                  Text(
                    "${widget.product.unitOfQuantity} ${widget.product.quantity * widget.product.count}",
                    style: Get.textTheme.titleMedium!.copyWith(
                      fontSize: FontSize.s10,
                    ),
                  ),
                  Text(
                    "${widget.product.iPrice * widget.product.count} \$",
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
                    onTap: () => productsController.minus(id: widget.product.id),
                  ),
                  const SizedBox(width: AppSize.s12),
                  Text(
                    "${widget.product.count}",
                    style: Get.textTheme.titleLarge!
                        .copyWith(color: ColorManager.grey, fontSize: FontSize.s18),
                  ),
                  const SizedBox(width: AppSize.s12),
                  GestureDetector(
                    onTap: () => productsController.plus(id: widget.product.id),
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
    );
  }
}
