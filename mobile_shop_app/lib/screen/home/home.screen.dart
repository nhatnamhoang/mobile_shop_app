import 'package:mobile_shop_app/@share/utils/util.dart';
import 'package:mobile_shop_app/@share/widget/appbar_custom.dart';
import 'package:mobile_shop_app/@share/widget/bottom_navigation_viewpager.dart';
import 'package:mobile_shop_app/@share/widget/scaffold.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_shop_app/@share/widget/stateful/grid_product.dart';
import 'package:mobile_shop_app/@share/widget/stateful/search_custom_field.dart';
import 'package:mobile_shop_app/resources/styles/colors.dart';
import 'package:mobile_shop_app/resources/styles/images.dart';
import 'package:mobile_shop_app/resources/styles/styles.dart';
import 'package:mobile_shop_app/screen/discover/discover.screen.dart';

import 'home.controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  final homeController = Get.put(HomeController());

  onClickTab(int index) {
    homeController.pageController.jumpToPage(index);
    homeController.updateIndexTab(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarCustom(
        title: Obx(
          () => Text(
            homeController.indexTab.value == 0 ? "Home" : "Discover",
            style: AppStyles()
                .typeOpenSans(17, AppColors.blackTitle)
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        iconBuy: Obx(() => homeController.indexTab.value == 1
            ? InkWell(
                onTap: () => {},
                child: Container(
                  margin: EdgeInsets.only(left: 16),
                  width: 24,
                  height: 24,
                  child: Image.asset(AppImages.icBuy),
                ),
              )
            : const SizedBox()),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: onClickTab,
        controller: homeController.pageController,
        children: [_buildHomePage(), DiscoverScreen()],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationViewPager(
          index: homeController.indexTab.value,
          onTapTab: onClickTab,
        ),
      ),
    );
  }

  Widget _buildHomePage() => Container(
        height: heightScreen(),
        width: widthScreen(),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              heightSpace(32),
              SearchCustomField(
                icon: AppImages.icSearch,
                hintText: 'Search',
              ),
              heightSpace(32),
              _buildBanner(),
              heightSpace(33),
              _buildHeaderPopular(),
              heightSpace(20),
              _buildGridView()
            ],
          ),
        ),
      );

  Widget _buildBanner() => Container(
        width: widthScreen(),
        child: Image.asset(
          AppImages.banner,
          fit: BoxFit.contain,
        ),
      );

  Widget _buildHeaderPopular() => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Popular Item",
              style: AppStyles()
                  .typeRoboto(16, AppColors.blackTitle)
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              "See All",
              style: AppStyles().typeRoboto(11, AppColors.mainColor),
            )
          ],
        ),
      );

  Widget _buildGridView() => Container(
        width: widthScreen(),
        child: GridProduct(),
      );
}
