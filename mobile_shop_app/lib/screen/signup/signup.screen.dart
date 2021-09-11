import 'package:mobile_shop_app/@core/router/pages.dart';
import 'package:mobile_shop_app/@share/utils/util.dart';
import 'package:mobile_shop_app/@share/widget/filled_round_button.dart';
import 'package:mobile_shop_app/@share/widget/scaffold.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_shop_app/@share/widget/stateful/terms_of_service.dart';
import 'package:mobile_shop_app/@share/widget/stateless/have_account_login.dart';
import 'package:mobile_shop_app/@share/widget/stateless/item_custom_text_field.dart';
import 'package:mobile_shop_app/resources/styles/colors.dart';
import 'package:mobile_shop_app/resources/styles/images.dart';
import 'package:mobile_shop_app/resources/styles/styles.dart';
import 'package:mobile_shop_app/screen/signup/signup.controller.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: heightScreen(),
        width: widthScreen(),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _itemHeader(),
              heightSpace(70),
              ItemCustomTextField(
                hintText: "Full name",
                icon: AppImages.icProfileActive,
              ),
              heightSpace(14),
              ItemCustomTextField(
                hintText: "Email or Phone ",
                icon: AppImages.icEmail,
              ),
              heightSpace(14),
              ItemCustomTextField(
                hintText: "Password",
                icon: AppImages.icClock,
              ),
              heightSpace(14),
              ItemCustomTextField(
                hintText: "Confirm password",
                icon: AppImages.icClock,
              ),
              heightSpace(16),
              _itemTermsOfService(),
              heightSpace(40),
              _btnSubmit(),
              heightSpace(90),
              HaveAccountLogin(
                onTap: () => goToAndRemoveAll(screen: ROUTER_HOME),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _btnSubmit() {
    return Container(
      height: 50,
      child: FilledRoundButton.withColor(
        onTap: () => {},
        pureColor: AppColors.accentColor,
        radius: 6,
        text: Text(
          "Sign Up",
          style: AppStyles()
              .typeOpenSans(17, AppColors.white)
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _itemTermsOfService() => Container(
        child: TermsOfService(
          textAgreeTermService: "Agree with trams and condition.",
          size: 12,
          sizeIcon: 8,
        ),
      );

  Widget _itemHeader() => Container(
        margin: const EdgeInsets.only(top: 126),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Sign ",
                  style: AppStyles()
                      .typeRoboto(40, AppColors.black)
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  "Up",
                  style: AppStyles()
                      .typeRoboto(40, AppColors.mainColor)
                      .copyWith(fontWeight: FontWeight.w500),
                )
              ],
            ),
            heightSpace(10),
            Text(
              "Create a new account!",
              style: AppStyles()
                  .typeRoboto(24)
                  .copyWith(fontWeight: FontWeight.w400),
            )
          ],
        ),
      );
}
