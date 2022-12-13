import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/utilities/resources/color_manager.dart';
import 'package:task1/utilities/resources/font_manager.dart';
import 'package:task1/utilities/resources/values_manager.dart';

class LocationCard extends StatelessWidget {
  final String location;

  const LocationCard({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p12,
        horizontal: AppPadding.p16,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/icons/title.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_on_outlined,
            size: AppSize.s22,
            color: ColorManager.white,
          ),
          const SizedBox(width: AppSize.s6),
          Text(
            location,
            style: Get.textTheme.displayMedium!.copyWith(fontSize: FontSize.s14),
          ),
        ],
      ),
    );
  }
}
