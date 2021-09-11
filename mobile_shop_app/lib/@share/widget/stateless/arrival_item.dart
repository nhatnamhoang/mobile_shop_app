import 'package:flutter/material.dart';
import 'package:mobile_shop_app/@share/utils/util.dart';
import 'package:mobile_shop_app/resources/styles/colors.dart';
import 'package:mobile_shop_app/resources/styles/images.dart';
import 'package:mobile_shop_app/resources/styles/styles.dart';

import '../filled_round_button.dart';

class ArrivalItem extends StatelessWidget {
  const ArrivalItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: _buildImageProduct(),
          ),
          Flexible(
            flex: 3,
            child: _buidlContent(),
          ),
          Flexible(
            flex: 2,
            child: _btnShopNow(),
          )
        ],
      ),
    );
  }

  Widget _buildImageProduct() => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.arrivalColor,
        ),
        child: Image.asset(AppImages.mobile),
      );

  Widget _buidlContent() => Container(
        margin: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNameProduct(),
            heightSpace(6),
            _buildProductRating(),
            heightSpace(10),
            _buildProductPrice()
          ],
        ),
      );

  Widget _buildNameProduct() => Container(
        child: Text(
          "Oneplus 9",
          style: AppStyles()
              .typeOpenSans(17)
              .copyWith(fontWeight: FontWeight.w700),
        ),
      );

  Widget _buildProductRating() => Container(
        child: Row(
          children: [
            Image.asset(AppImages.icStar),
            widthSpace(4),
            Text("4.5 (3k review)",
                style: AppStyles().typeOpenSans(11, AppColors.black)),
          ],
        ),
      );

  Widget _buildProductPrice() => Container(
        child: Text(
          "344 AED",
          style: AppStyles()
              .typeOpenSans(12, AppColors.mainColor)
              .copyWith(fontWeight: FontWeight.w600),
        ),
      );

  Widget _btnShopNow() {
    return Container(
      margin: const EdgeInsets.only(right: 13),
      height: 30,
      child: FilledRoundButton.withColor(
        onTap: () => {},
        pureColor: AppColors.mainColor,
        radius: 32,
        text: Text("Shop Now",
            style: AppStyles().typeOpenSans(11, AppColors.white)),
      ),
    );
  }
}
