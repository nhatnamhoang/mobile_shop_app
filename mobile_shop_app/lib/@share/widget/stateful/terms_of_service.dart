import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop_app/@share/utils/util.dart';
import 'package:mobile_shop_app/resources/styles/colors.dart';
import 'package:mobile_shop_app/resources/styles/styles.dart';

class TermsOfService extends StatefulWidget {
  final double? size;
  final double? sizeIcon;
  final String? textTermService;
  final String? textAgreeTermService;
  final bool? statusTermsOfService;
  final VoidCallback? onClickChangeStatusService;
  final VoidCallback? onClickViewTermService;
  const TermsOfService(
      {Key? key,
      required this.size,
      required this.sizeIcon,
      this.statusTermsOfService = false,
      this.onClickChangeStatusService,
      this.onClickViewTermService,
      required this.textAgreeTermService,
      this.textTermService})
      : super(key: key);

  @override
  _TermsOfServiceState createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: widget.onClickChangeStatusService,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(width: 1, color: AppColors.greyIcon),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: widget.statusTermsOfService!
                    ? Icon(
                        Icons.check,
                      )
                    : const SizedBox(),
                color: AppColors.greyIcon,
                iconSize: widget.sizeIcon!,
                padding: EdgeInsets.all(0.0),
                splashColor: AppColors.mainColor,
              ),
            ),
          ),
        ),
        widthSpace(10),
        RichText(
          text: TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = widget.onClickViewTermService,
            text: widget.textTermService ?? "",
            style: AppStyles().typeRoboto(16, AppColors.greyIcon),
            children: <TextSpan>[
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = widget.onClickChangeStatusService,
                text: widget.textAgreeTermService,
                style: AppStyles().typeRoboto(16, AppColors.greyIcon),
              )
            ],
          ),
        )
      ],
    );
  }
}
