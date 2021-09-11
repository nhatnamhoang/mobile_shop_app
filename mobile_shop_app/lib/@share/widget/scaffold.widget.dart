import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomScaffold extends StatefulWidget {
  PreferredSizeWidget? appBar;
  Widget? body;
  String? titleAppBar;

  CustomScaffold({
    this.appBar,
    required this.body,
    this.titleAppBar,
  });

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar ??
          AppBar(
            title: Text(widget.titleAppBar ?? ""),
            centerTitle: true,
          ),
      body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: widget.body),
      resizeToAvoidBottomInset: true,
    );
  }
}
