import 'package:flutter/material.dart';
import 'package:mobile_shop_app/@share/utils/util.dart';
import 'package:mobile_shop_app/resources/styles/colors.dart';
import 'package:mobile_shop_app/resources/styles/images.dart';
import 'package:mobile_shop_app/resources/styles/styles.dart';

class ProductRecommendation extends StatelessWidget {
  const ProductRecommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
          _buildImageProduct(),
          heightSpace(6),
          _buildNameProduct(),
          heightSpace(5),
          _buildTotalProduct(),
        ],
      ),
    );
  }

  Widget _buildImageProduct() => Container(
        child: Image.asset(
          AppImages.product,
          fit: BoxFit.contain,
        ),
      );

  Widget _buildNameProduct() => Container(
        child: Text(
          "Smartphone",
          style: AppStyles().typeOpenSans(15, AppColors.blackTitle),
        ),
      );

  Widget _buildTotalProduct() => Container(
        child: Text(
          "36 items",
          style: AppStyles()
              .typeOpenSans(11, AppColors.greyIcon)
              .copyWith(fontWeight: FontWeight.w600),
        ),
      );
}
