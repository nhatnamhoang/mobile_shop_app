import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_shop_app/@share/utils/util.dart';
import 'package:mobile_shop_app/@share/widget/stateful/production_recommendation.dart';
import 'package:mobile_shop_app/@share/widget/stateful/search_custom_field.dart';
import 'package:mobile_shop_app/@share/widget/stateless/arrival_item.dart';
import 'package:mobile_shop_app/resources/styles/colors.dart';
import 'package:mobile_shop_app/resources/styles/images.dart';
import 'package:mobile_shop_app/resources/styles/styles.dart';
import 'package:mobile_shop_app/screen/discover/discover.controller.dart';

class DiscoverScreen extends GetView<DiscoverController> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            _buildListRecommendation(),
            heightSpace(32),
            _buildHeader(title: "New Arrivals"),
            heightSpace(16),
            _buildListArrivals(),
            heightSpace(32),
            _buildBanner(),
            heightSpace(32),
            _buildHeader(title: "Best Seller"),
            _buildListArrivals(),
          ],
        ),
      ),
    );
  }

  Widget _buildListRecommendation() => Container(
        height: 180,
        width: widthScreen(),
        child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
                  child: ProductRecommendation(),
                )),
      );

  Widget _buildHeader({String? title}) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title!,
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

  Widget _buildListArrivals() => Container(
        child: Column(
          children: [
            ArrivalItem(),
            ArrivalItem(),
            ArrivalItem(),
          ],
        ),
      );

  Widget _buildBanner() => Container(
        width: widthScreen(),
        child: Image.asset(
          AppImages.banner2,
          fit: BoxFit.contain,
        ),
      );
}
