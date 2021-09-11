import 'package:flutter/material.dart';

class TextButtonCustom extends StatelessWidget {
  TextButtonCustom({
    Key? key,
    @required this.text,
    this.onClick,
    this.padding = const EdgeInsets.symmetric(
      vertical: 5.0,
      horizontal: 8.0,
    ),
  }) : super(key: key);
  final Widget? text;
  final Function()? onClick;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: onClick!,
      child: Padding(
        padding: padding!,
        child: text,
      ),
    );
  }
}
