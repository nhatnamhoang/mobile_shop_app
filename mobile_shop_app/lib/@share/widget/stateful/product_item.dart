import 'package:flutter/material.dart';
import 'package:mobile_shop_app/@share/utils/util.dart';
import 'package:mobile_shop_app/@share/widget/stateless/discount.dart';
import 'package:mobile_shop_app/resources/styles/colors.dart';
import 'package:mobile_shop_app/resources/styles/images.dart';
import 'package:mobile_shop_app/resources/styles/styles.dart';

class ProductItem extends StatefulWidget {
  final bool? haveDiscount;
  const ProductItem({Key? key, this.haveDiscount = true}) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.whiteOpacity,
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          _buildItemsHeartAndDiscount(),
          _buildImageProduct(),
          heightSpace(20),
          _buildNameProduct(),
          heightSpace(8),
          _buildProductPrice(),
          heightSpace(8),
          _buildProductRating()
        ],
      ),
    );
  }

  Widget _buildItemsHeartAndDiscount() => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.haveDiscount!)
              DiscountWidget(
                discount: 30,
                key: Key('discount'),
              )
            else
              const SizedBox(),
            Image.asset(
              AppImages.icHeart,
              fit: BoxFit.contain,
            )
          ],
        ),
      );

  Widget _buildImageProduct() => Container(
        child: Image.asset(
          AppImages.product,
          fit: BoxFit.contain,
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

  Widget _buildProductPrice() => Container(
        child: Text(
          "945.00 AED",
          style: AppStyles()
              .typeOpenSans(12, AppColors.mainColor)
              .copyWith(fontWeight: FontWeight.w600),
        ),
      );

  Widget _buildProductRating() => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.icStar),
            widthSpace(4),
            Text("4.5 (3k review)",
                style: AppStyles().typeOpenSans(11, AppColors.black)),
          ],
        ),
      );
}
