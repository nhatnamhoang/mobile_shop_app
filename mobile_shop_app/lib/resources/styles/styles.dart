import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'fonts.dart';


class AppStyles {
  static var mainTheme = ThemeData(
    primaryColor: AppColors.mainColor,
    accentColor: AppColors.mainColor,
    platform: TargetPlatform.iOS,
    scaffoldBackgroundColor: AppColors.white,
    errorColor: AppColors.red,
    dialogBackgroundColor: AppColors.white,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.backgroundColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
  );

  TextStyle typeOpenSans(double size, [HexColor? color]) {
    return GoogleFonts.openSans(
      fontSize: size,
      color: color ?? AppColors.greyIcon,
    );
  }

  TextStyle typeRoboto(double size, [HexColor? color]) {
    return GoogleFonts.roboto(
      fontSize: size,
      color: color ?? AppColors.greyIcon,
    );
  }

  TextStyle typeError() {
    return GoogleFonts.openSans(fontSize: 10.5, color: AppColors.red);
  }
}

class AppSize {
  static final double leadingAppBarIcon = 28.0;

  //Avatar
  static final double avatarItemFriendSuggestionRadius = 25.0;
  static final double heightDivider = 1.0;

  // Button
  static final double loginButtonWidth = 500.0;
  static final double loginButtonHeight = 50.0;
  static final double followButtonWidth = 79.0;
  static final double followButtonHeight = 35.0;
  static final double unFollowButtonWidth = 87.0;
  static final double unFollowButtonHeight = 35.0;
  static final double iconComment = 25.0;

//  static final double widthImageGrid = (MediaQuery.of(MyApp.navigatorKey.currentContext).size.width - 4) / 2;
//  static final double widthImagePost = MediaQuery.of(MyApp.navigatorKey.currentContext).size.width - Margin.marginHorizontalApp;
}