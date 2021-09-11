import 'package:flutter/material.dart';
import 'package:mobile_shop_app/resources/styles/colors.dart';
import 'package:mobile_shop_app/resources/styles/styles.dart';

class HaveAccountLogin extends StatelessWidget {
  final VoidCallback? onTap;
  const HaveAccountLogin({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Have an account? ",
            style: AppStyles()
                .typeOpenSans(16)
                .copyWith(fontWeight: FontWeight.w600),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              "Log In",
              style: AppStyles()
                  .typeOpenSans(16, AppColors.mainColor)
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
