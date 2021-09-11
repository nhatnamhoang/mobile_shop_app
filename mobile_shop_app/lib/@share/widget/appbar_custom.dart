import 'package:flutter/material.dart';
import 'package:mobile_shop_app/@share/utils/util.dart';
import 'package:mobile_shop_app/resources/styles/colors.dart';
import 'package:mobile_shop_app/resources/styles/images.dart';
import 'package:mobile_shop_app/resources/styles/styles.dart';

class AppbarCustom extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? iconLeading;
  final Widget? iconBuy;
  final bool? showBackButton;
  final Function? onTapBack;
  final VoidCallback? onTapNotification;
  final VoidCallback? onTapLeading;
  const AppbarCustom(
      {Key? key,
      required this.title,
      this.iconLeading,
      this.onTapNotification,
      this.onTapBack,
      this.onTapLeading,
        this.iconBuy,
      this.showBackButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title!,
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      leading: (showBackButton!)
          ? buildIconButtonBack(onTapBack)
          : _buildIconActionButton(
              icon: AppImages.icCategory, callback: onTapLeading, isLeft: true),
      actions: <Widget>[
        iconBuy!,
        _buildIconActionButton(
            icon: AppImages.icNotification, callback: onTapNotification)
      ],
    );
  }

  Widget _buildIconActionButton(
          {String? icon, VoidCallback? callback, bool? isLeft = false}) =>
      InkWell(
        onTap: callback,
        child: Container(
          margin: EdgeInsets.only(left: 25, right: isLeft! ? 0 : 25),
          width: 24,
          height: 24,
          child: Image.asset(icon!),
        ),
      );

  IconButton buildIconButtonBack([Function? onTap]) {
    return IconButton(
      onPressed: () {
        onTap == null ? goBack() : onTap();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors.white,
        size: AppSize.leadingAppBarIcon,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
