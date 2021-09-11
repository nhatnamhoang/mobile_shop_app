import 'package:flutter/material.dart';

class AppColors {
  static var mainColor = HexColor("#38972E");
  static var red = HexColor('#FF0000');
  static var white = HexColor('#FFFFFF');
  static var black = HexColor('#000000');
  static var blackTitle = HexColor('#141010');
  static var greyBlack = HexColor('#1F272E');
  static var greyIcon = HexColor('##828282');
  static var mediumGrayW600 = HexColor('#666666');
  static var backgroundColor = HexColor('#E5E5E5');
  static var accentColor = HexColor('#414138');
  static var arrivalColor = HexColor('#ECE9F1');
  static var labelDropShadow = Color.fromRGBO(0, 0, 0, 0.03);
  static var whiteDropShadow = Color.fromRGBO(0, 0, 0, 0.07);
  static var blackOpacity = Color.fromRGBO(0, 0, 0, 0.25);
  static var whiteOpacity = Color.fromRGBO(65, 65, 56, 0.14);
}

// Parse hex to color.
class HexColor extends Color {
  static int _getColorFromHex(hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(value) : super(_getColorFromHex(value));
}
