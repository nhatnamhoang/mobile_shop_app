import 'package:flutter/material.dart';

class FilledRoundButton extends StatefulWidget {
  final Gradient? gradientColor;
  final Color? pureColor;
  final double? radius;
  final Text? text;
  final Widget? prefIcon;
  final VoidCallback? onTap;

  FilledRoundButton.withGradient({
    @required this.gradientColor,
    this.radius = 30.0,
    this.text,
    this.prefIcon,
    this.onTap,
  }) : this.pureColor = null;

  FilledRoundButton.withColor({
    @required this.pureColor,
    this.radius = 30.0,
    this.text,
    this.prefIcon,
    this.onTap,
  }) : this.gradientColor = null;

  @override
  _FilledRoundButtonState createState() => _FilledRoundButtonState();
}

class _FilledRoundButtonState extends State<FilledRoundButton> {
  @override
  Widget build(BuildContext context) {
    Widget childWidgetButton = widget.prefIcon == null
        ? Center(child: widget.text)
        : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        widget.prefIcon!,
        const SizedBox(width: 5.0),
        Container(
          child: widget.text,
        )
      ],
    );

    return Container(
      decoration: BoxDecoration(
        color: widget.pureColor,
        gradient: widget.gradientColor,
        borderRadius: BorderRadius.circular(
          widget.radius!,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          // make splash shape fit round button when tap,
          // if not specified, splash shape is rectangle instead of round
          borderRadius: BorderRadius.circular(
            widget.radius!,
          ),
          highlightColor: Colors.transparent,
          onTap: widget.onTap == null ? () => {} : widget.onTap,
          child: childWidgetButton,
        ),
      ),
    );
  }
}

class FilledRoundButtonBooking extends StatefulWidget {
  final Gradient? gradientColor;
  final Color? pureColor;
  final double? radius;
  final String? textAbove;
  final Widget? textBelow;
  final Widget? prefIcon;
  final VoidCallback? onTap;

  FilledRoundButtonBooking.withGradient({
    @required this.gradientColor,
    this.radius = 30.0,
    this.textAbove,
    this.textBelow,
    this.onTap,
    this.prefIcon,
  }) : this.pureColor = null;

  FilledRoundButtonBooking.withColor({
    @required this.pureColor,
    this.radius = 30.0,
    this.textAbove,
    this.textBelow,
    this.prefIcon,
    this.onTap,
  }) : this.gradientColor = null;

  @override
  _FilledRoundButtonBookingState createState() =>
      _FilledRoundButtonBookingState();
}

class _FilledRoundButtonBookingState extends State<FilledRoundButtonBooking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.pureColor,
        gradient: widget.gradientColor,
        borderRadius: BorderRadius.circular(
          widget.radius!,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          // make splash shape fit round button when tap,
          // if not specified, splash shape is rectangle instead of round
          borderRadius: BorderRadius.circular(
            widget.radius!,
          ),
          highlightColor: Colors.transparent,
          onTap: widget.onTap == null ? () => {} : widget.onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.textAbove!,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    fontSize: 15.0),
              ),
              SizedBox(height: 4,),
              widget.textBelow!,
            ],
          ),
        ),
      ),
    );
  }
}
