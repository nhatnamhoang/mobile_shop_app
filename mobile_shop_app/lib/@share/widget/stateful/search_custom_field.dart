import 'package:flutter/material.dart';
import 'package:mobile_shop_app/@share/utils/util.dart';
import 'package:mobile_shop_app/@share/widget/stateless/item_custom_text_field.dart';
import 'package:mobile_shop_app/resources/styles/colors.dart';
import 'package:mobile_shop_app/resources/styles/images.dart';
import 'package:mobile_shop_app/resources/styles/styles.dart';

import '../custom_text_field.dart';

class SearchCustomField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? icon;
  const SearchCustomField(
      {Key? key, required this.hintText, required this.icon, this.controller})
      : super(key: key);

  @override
  _SearchCustomFieldState createState() => _SearchCustomFieldState();
}

class _SearchCustomFieldState extends State<SearchCustomField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.whiteDropShadow,
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: _buildIconTextField(),
                ),
                Flexible(
                  flex: 5,
                  child: CustomTextField(
                    backgroundColor: AppColors.white,
                    cursorColor: AppColors.white,
                    paddingVertical: 2,
                    hintText: "Search",
                    styleHintText: AppStyles()
                        .typeOpenSans(16, AppColors.greyIcon)
                        .copyWith(fontWeight: FontWeight.w400),
                    controller: widget.controller,
                  ),
                ),
              ],
            ),
          ),
        ),
        widthSpace(10),
        Flexible(
          flex: 1,
          child: _buildIconFilter(),
        )
      ],
    );
  }

  Widget _buildIconTextField() => Container(
        padding: const EdgeInsets.all(18).copyWith(right: 0),
        child: Image.asset(
          widget.icon!,
          height: 14,
          width: 14,
          fit: BoxFit.contain,
        ),
      );

  Widget _buildIconFilter() => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.blackTitle,
          boxShadow: [
            BoxShadow(
              color: AppColors.whiteDropShadow,
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Image.asset(
          AppImages.icFilter,
          height: 24,
          width: 24,
        ),
      );
}
