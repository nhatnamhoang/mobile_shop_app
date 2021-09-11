import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? cursorColor;
  final bool? hasBorder;
  final Widget? suffixIcon;
  final double? paddingVertical;
  final bool? isAlignText;
  final TextEditingController? controller;
  final TextStyle? styleText;
  final TextStyle? styleHintText;
  final FocusNode? focusNode;
  final bool? obscureText;
  final BorderRadius? borderRadius;
  final TextInputType? keyboardType;
  final Function(String)? onValueChanged;
  final Function(String)? onCompleted;

  CustomTextField({
    Key? key,
    this.hintText = 'Place holder',
    this.backgroundColor,
    this.isAlignText = false,
    this.focusNode,
    this.onCompleted,
    this.borderColor = Colors.red,
    this.suffixIcon,
    this.paddingVertical = 5,
    this.controller,
    this.hasBorder = false,
    this.styleText,
    this.styleHintText,
    this.borderRadius,
    this.keyboardType = TextInputType.text,
    this.onValueChanged,
    this.cursorColor,
    this.obscureText = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(0.0)),
        border: hasBorder == false
            ? Border.all(color: Colors.transparent)
            : Border.all(color: borderColor!, width: 1.5),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, paddingVertical!, 16, paddingVertical!),
        child: TextField(
          textAlign: isAlignText == true ? TextAlign.center : TextAlign.start,
          controller: controller,
          focusNode: focusNode,
          style: styleText, //,
          textInputAction: TextInputAction.done,
          keyboardType: keyboardType,
          onChanged: onValueChanged,
          onSubmitted: onCompleted,
          cursorColor: cursorColor,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            suffixIcon: suffixIcon,
          ),
          autocorrect: false,
          obscureText: obscureText!,
        ),
      ),
    );
  }
}
