import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as ft;

void showToast(String mes, BuildContext context,
    {bool isSuccess = false, Function? onTap}) {
  if (mes == null || mes.trim() == '') return;
  Toast.show(mes, context,
      duration: mes.length > 40 ? 5 : 3,
      gravity: Toast.TOP,
      backgroundColor: isSuccess
          ? Colors.green.withOpacity(0.85)
          : Colors.red.withOpacity(0.85),
      onTap: onTap);
}

Future showToastNoContext(String mes, {Color? bgColor, Color? textColor}) async {
  await ft.Fluttertoast.cancel();
  return ft.Fluttertoast.showToast(
      fontSize: 14,
      msg: mes,
      toastLength: ft.Toast.LENGTH_SHORT,
      gravity: ft.ToastGravity.TOP,
      backgroundColor: bgColor ?? Colors.white,
      textColor: textColor ?? Colors.blue);
}

class Toast {
  static final int LENGTH_SHORT = 1;
  static final int LENGTH_LONG = 2;
  static final int BOTTOM = 0;
  static final int CENTER = 1;
  static final int TOP = 2;

  static void show(String msg, BuildContext context,
      {int duration = 1,
        int gravity = 0,
        Color backgroundColor = const Color(0xAA000000),
        Color textColor = Colors.white,
        double backgroundRadius = 20,
        Border? border,
        Function? onTap}) {
    ToastView.dismiss();
    ToastView.createView(msg, context, duration, gravity, backgroundColor,
        textColor, backgroundRadius, border,
        onTap: onTap);
  }
}

class ToastView {
  static final ToastView _singleton = new ToastView._internal();

  factory ToastView() {
    return _singleton;
  }

  ToastView._internal();

  static OverlayState? overlayState;
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  static void createView(
      String msg,
      BuildContext context,
      int duration,
      int gravity,
      Color background,
      Color textColor,
      double backgroundRadius,
      Border? border,
      {Function? onTap}) async {
    overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = background;

    _overlayEntry = new OverlayEntry(
      builder: (BuildContext context) => ToastWidget(
          onTap: onTap,
          widget: Container(
            width: MediaQuery.of(context).size.width,
            child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(backgroundRadius),
                    border: border,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
                  child: Text(msg,
                      softWrap: true,
                      style: TextStyle(fontSize: 15, color: textColor)),
                )),
          ),
          gravity: gravity),
    );
    _isVisible = true;
    overlayState!.insert(_overlayEntry!);
    await new Future.delayed(
        Duration(seconds: duration == null ? Toast.LENGTH_SHORT : duration));
    dismiss();
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}

class ToastWidget extends StatelessWidget {
  ToastWidget(
      {Key? key, required this.widget, required this.gravity, this.onTap})
      : super(key: key);

  final Widget widget;
  final int gravity;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
        top: gravity == 2 ? 50 : null,
        bottom: gravity == 0 ? 50 : null,
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(onTap: onTap as void Function()?, child: widget),
        ));
  }
}
