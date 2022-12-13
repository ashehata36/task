import 'package:flutter/material.dart';
import 'package:task1/utilities/resources/color_manager.dart';
import 'package:task1/utilities/resources/font_manager.dart';
import 'package:task1/utilities/resources/styles_manager.dart';
import 'package:task1/utilities/resources/values_manager.dart';

ThemeData getApplicationTheme() => ThemeData(
      fontFamily: FontConstants.fontFamily,
      backgroundColor: ColorManager.bg,
      scaffoldBackgroundColor: ColorManager.bg,
      //Main Colors
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.lightPrimary,

      //Card View Theme
      cardTheme: CardTheme(
        color: ColorManager.white,
        shadowColor: ColorManager.darkGrey,
        elevation: AppSize.s1_5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        /*margin: const EdgeInsets.symmetric(
          vertical: AppSize.s4,
          horizontal: AppSize.s4,
        ),*/
      ),

      //AppBar Theme
      appBarTheme: AppBarTheme(
        foregroundColor: ColorManager.grey,
        backgroundColor: ColorManager.bg,
        centerTitle: true,
        elevation: 0,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle: getBoldTextStyle(color: ColorManager.grey, fontSize: AppSize.s18),
      ),

      //Button Theme
      buttonTheme: ButtonThemeData(
          splashColor: ColorManager.lightPrimary,
          shape: const StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primary),

      //Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getBoldTextStyle(color: ColorManager.white, fontSize: FontSize.s14),
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p4,
            horizontal: AppPadding.p8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s4),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: getBoldTextStyle(color: ColorManager.white, fontSize: FontSize.s14),
          padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p4,
            horizontal: AppPadding.p8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s4),
            side: const BorderSide(color: Colors.red),
          ),
        ),
      ),

      // text theme
      textTheme: TextTheme(
        displayLarge: getLightTextStyle(color: ColorManager.black, fontSize: FontSize.s22),
        headlineLarge: getSemiBoldTextStyle(color: ColorManager.black, fontSize: FontSize.s16),
        titleMedium: getSemiBoldTextStyle(color: ColorManager.black, fontSize: FontSize.s14),
        titleLarge: getBoldTextStyle(color: ColorManager.black, fontSize: FontSize.s16),
        bodyLarge: getRegularTextStyle(color: ColorManager.grey1),
        bodySmall: getRegularTextStyle(color: ColorManager.black, fontSize: FontSize.s12),
        bodyMedium: getRegularTextStyle(color: ColorManager.black),
        headlineMedium: getRegularTextStyle(color: ColorManager.white, fontSize: FontSize.s16),
        displayMedium: getBoldTextStyle(color: ColorManager.white, fontSize: FontSize.s18),
        titleSmall: getSemiBoldTextStyle(color: ColorManager.black, fontSize: FontSize.s18),
        labelLarge: getBoldTextStyle(color: ColorManager.black, fontSize: FontSize.s22),
      ),

      //inputDecoration Theme (Text Form Field)
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p20),
        hintStyle: getRegularTextStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        labelStyle: getMediumTextStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        counterStyle: getMediumTextStyle(color: ColorManager.grey, fontSize: FontSize.s14),
        errorStyle: getRegularTextStyle(color: ColorManager.error),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.lightGrey, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    );
