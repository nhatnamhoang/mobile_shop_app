import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile_shop_app/@core/router/pages.dart';
import 'package:mobile_shop_app/@core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobile_shop_app/resources/localization/app_internalization.dart';
import 'package:mobile_shop_app/resources/styles/colors.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
    _initLoading();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      theme: _applicationTheme(),
      defaultTransition: Transition.fadeIn,
      builder: (_, child) => FlutterEasyLoading(child: child),
      initialRoute: ROUTER_SIGNUP,
      getPages: Routers.route,
      localizationsDelegates: [
        const AppInternalizationlegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
        Locale('ru', ''),
        Locale('ar'),
        Locale('es'),
      ],
    );
  }

  _applicationTheme() => ThemeData(
      appBarTheme: AppBarTheme(color: AppColors.mainColor),
      backgroundColor: AppColors.backgroundColor,
      scaffoldBackgroundColor: AppColors.backgroundColor);

  void _initLoading() => EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 1500)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..maskType = EasyLoadingMaskType.black
    ..loadingStyle = EasyLoadingStyle.light
    ..toastPosition = EasyLoadingToastPosition.bottom
    ..indicatorSize = 45
    ..radius = 10
    ..fontSize = 14
    ..userInteractions = false;
}
