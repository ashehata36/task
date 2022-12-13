import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/data/controllers/products_controllers/products_controller.dart';
import 'package:task1/domain/models/ad_model/ad_model.dart';
import 'package:task1/domain/models/category_model/category_model.dart';
import 'package:task1/presentation/widgets/grocery_deal_card.dart';
import 'package:task1/presentation/widgets/location_card.dart';
import 'package:task1/utilities/resources/color_manager.dart';
import 'package:task1/utilities/resources/font_manager.dart';
import 'package:task1/utilities/resources/values_manager.dart';

class GroceryView extends StatefulWidget {
  const GroceryView({Key? key}) : super(key: key);

  @override
  State<GroceryView> createState() => _GroceryViewState();
}

class _GroceryViewState extends State<GroceryView> {
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
                        const LocationCard(location: "Mustafa St."),
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
                    const SizedBox(height: AppSize.s14),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: ColorManager.lightGrey,
                        border: Border.all(
                          color: ColorManager.grey1.withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(AppSize.s14),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
                            child: Icon(
                              Icons.search,
                              size: AppSize.s28,
                            ),
                          ),
                          Flexible(
                              child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search in thousands of products",
                              hintStyle: Get.textTheme.titleMedium!.copyWith(
                                color: ColorManager.searchTextColor,
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSize.s22),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: dummyAddresses.addresses
                            .map(
                              (e) => Container(
                                width: Get.width / 2,
                                padding: const EdgeInsets.all(AppPadding.p4),
                                margin: const EdgeInsets.only(
                                  right: AppMargin.m14,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorManager.white,
                                  border: Border.all(
                                    color: ColorManager.grey1.withOpacity(0.1),
                                  ),
                                  borderRadius: BorderRadius.circular(AppSize.s14),
                                ),
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: AppSize.s50,
                                        width: AppSize.s50,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffE3DDD6),
                                          borderRadius: BorderRadius.circular(AppSize.s14),
                                        ),
                                      ),
                                      const SizedBox(width: AppSize.s8),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(e.title, style: Get.textTheme.titleMedium),
                                          Text(e.description),
                                          Text(e.details),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: AppSize.s22),
                    ListTile(
                      leading: Text(
                        "Explore by Category",
                        style: Get.textTheme.titleLarge,
                      ),
                      trailing: Text(
                        "See All (36)",
                        style: Get.textTheme.bodySmall,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p8,
                        vertical: AppPadding.p14,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: dummyCategories.categories
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.only(right: AppPadding.p14),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: e.color, borderRadius: BorderRadius.circular(AppSize.s14)),
                                        child: const SizedBox(
                                          width: AppSize.s66,
                                          height: AppSize.s66,
                                        ),
                                      ),
                                      const SizedBox(height: AppSize.s5),
                                      Text(
                                        e.title,
                                        style: Get.textTheme.displayMedium!.copyWith(
                                          color: const Color(0xff474749),
                                          fontSize: FontSize.s12,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s22),
                    ListTile(
                      leading: Text(
                        "Deals of the day",
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
                        builder: (productsController) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: productsController.allProducts.value.products
                                .map(
                                  (e) => GroceryDealCard(product: e),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSize.s22),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xfffec8bd),
                        borderRadius: BorderRadius.circular(AppSize.s14),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Expanded(
                            flex: 2,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: AppPadding.p27,
                                top: AppPadding.p27,
                                bottom: AppPadding.p17,
                              ),
                              child: Image.asset(
                                "assets/images/ad.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
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
