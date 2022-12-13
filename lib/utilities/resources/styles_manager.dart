import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task1/utilities/resources/font_manager.dart';

TextStyle _getTextStyle({required double fontSize, required FontWeight fontWeight, required Color color}) => GoogleFonts.montserrat(
  fontSize: fontSize,
  fontWeight: fontWeight,
  color: color,
);

//Regular Style
TextStyle getRegularTextStyle({double fontSize = FontSize.s12, required Color color}) => _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.regular,
      color: color,
    );

//Medium Style
TextStyle getMediumTextStyle({double fontSize = FontSize.s12, required Color color}) => _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.medium,
      color: color,
    );

//Bold Style
TextStyle getBoldTextStyle({double fontSize = FontSize.s12, required Color color}) => _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.bold,
      color: color,
    );

//Light Style
TextStyle getLightTextStyle({double fontSize = FontSize.s12, required Color color}) => _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.light,
      color: color,
    );

//semiBold Style
TextStyle getSemiBoldTextStyle({double fontSize = FontSize.s12, required Color color}) => _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManager.semiBold,
      color: color,
    );
