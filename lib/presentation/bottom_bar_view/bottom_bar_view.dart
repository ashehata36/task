import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:task1/data/controllers/bottom_bar_controller/bottom_bar_controller.dart';
import 'package:task1/presentation/cart_view/cart_view.dart';
import 'package:task1/presentation/favorites_view/favorites_view.dart';
import 'package:task1/presentation/grocery_view/grocery_view.dart';
import 'package:task1/presentation/news_view/news_view.dart';
import 'package:task1/utilities/resources/color_manager.dart';
import 'package:task1/utilities/resources/font_manager.dart';
import 'package:task1/utilities/resources/values_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({Key? key}) : super(key: key);

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {
  BottomBarController barController = Get.put(BottomBarController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<BottomBarController>(
        init: BottomBarController(),
        builder: (barController) => PersistentTabView(
          context,
          navBarHeight: AppSize.s70,
          screens: const [
            GroceryView(),
            NewsView(),
            NewsView(),
            FavoritesView(),
            CartView(),
          ],
          items: [
            PersistentBottomNavBarItem(
              icon: Image.asset(
                "assets/icons/home.png",
                fit: BoxFit.cover,
                color:
                    barController.currentPage.value == 0 ? ColorManager.primary : ColorManager.grey1.withOpacity(0.5),
              ),
              title: "Grocery",
              activeColorPrimary: ColorManager.primary,
              inactiveColorPrimary: ColorManager.grey1.withOpacity(0.5),
              textStyle: Get.textTheme.titleSmall!.copyWith(
                fontSize: FontSize.s8,
              ),
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(FontAwesomeIcons.bell),
              title: "News",
              activeColorPrimary: ColorManager.primary,
              inactiveColorPrimary: ColorManager.grey1.withOpacity(0.5),
              textStyle: Get.textTheme.titleSmall!.copyWith(
                fontSize: FontSize.s8,
              ),
            ),
            PersistentBottomNavBarItem(
              icon: SvgPicture.asset(
                "assets/icons/flouting_svg.svg",
                height: AppSize.s30,
                color: ColorManager.white,
              ),
              title: " ",
              activeColorPrimary: ColorManager.primary,
              inactiveColorPrimary: ColorManager.grey1.withOpacity(0.5),
              inactiveColorSecondary: ColorManager.white,
              activeColorSecondary: ColorManager.white,
              contentPadding: AppPadding.p8,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(FontAwesomeIcons.heart),
              title: "Favorites",
              activeColorPrimary: ColorManager.primary,
              inactiveColorPrimary: ColorManager.grey1.withOpacity(0.5),
              textStyle: Get.textTheme.titleSmall!.copyWith(
                fontSize: FontSize.s8,
              ),
            ),
            PersistentBottomNavBarItem(
              icon: Image.asset(
                "assets/icons/cart.png",
                fit: BoxFit.cover,
                color: barController.currentPage.value == 4 ? ColorManager.primary : ColorManager.grey1.withOpacity(0.5),
              ),
              title: "Cart",
              activeColorPrimary: ColorManager.primary,
              inactiveColorPrimary: ColorManager.grey1.withOpacity(0.5),
              textStyle: Get.textTheme.titleSmall!.copyWith(
                fontSize: FontSize.s8,
              ),
            ),
          ],
          confineInSafeArea: true,
          backgroundColor: ColorManager.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            colorBehindNavBar: Colors.transparent,
            borderRadius: BorderRadius.circular(AppSize.s14),
          ),
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.linear,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: false,
          ),
          navBarStyle: NavBarStyle.style15,
          onItemSelected: (value) => barController.onItemSelected(value),
        ),
      ),
    );
  }
}
