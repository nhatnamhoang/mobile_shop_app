import 'package:flutter/material.dart';
import 'package:mobile_shop_app/resources/styles/colors.dart';
import 'package:mobile_shop_app/resources/styles/styles.dart';

class DiscountWidget extends StatelessWidget {
  final int? discount;
  const DiscountWidget({Key? key, this.discount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.mainColor,
      ),
      child: Text(
        '$discount%',
        style: AppStyles().typeRoboto(11, AppColors.white),
      ),
    );
  }
}
