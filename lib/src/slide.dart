import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FlutterSlide extends StatefulWidget {
  ///To make button more customizable add your child widget
  final Widget child;

  ///Sets the radius of corners of a button.
  final double radius;

  ///Use it to define a height and width of widget.
  final double height;
  final double width;
  final double? buttonSize;

  ///Use it to define a color of widget.
  final Color backgroundColor;
  final Color baseColor;
  final Color highlightedColor;
  final Color buttonColor;

  ///Change it to gave a label on a widget of your choice.
  final Text? label;

  ///Gives a alignment to a slider icon.
  final Alignment alignLabel;
  final Function action;

  ///Make it false if you want to deactivate the shimmer effect.
  final bool shimmer;

  ///Make it false if you want maintain the widget in the tree.
  final bool dismissible;

  final bool vibrationFlag;

  ///The offset threshold the item has to be dragged in order to be considered
  ///dismissed e.g. if it is 0.4, then the item has to be dragged
  /// at least 40% towards one direction to be considered dismissed
  final double dismissThresholds;

  final bool disable;

  final BoxDecoration? decoration;
  final BoxDecoration? disabledDecoration;

  final BoxDecoration? buttonDecoration;
  final BoxDecoration? disabledButtonDecoration;

  const FlutterSlide(
      {Key? key,
      required this.action,
      required this.child,
      this.radius = 100,
      this.vibrationFlag = false,
      this.shimmer = true,
      this.height = 70,
      this.buttonSize,
      this.width = 250,
      this.alignLabel = const Alignment(-0.2, 0),
      this.backgroundColor = const Color(0xffe0e0e0),
      this.baseColor = Colors.black87,
      this.buttonColor = Colors.white,
      this.highlightedColor = const Color.fromARGB(255, 79, 76, 76),
      this.label,
      this.dismissible = true,
      this.dismissThresholds = 0.75,
      this.disable = false,
      this.decoration,
      this.disabledDecoration,
      this.disabledButtonDecoration,
      this.buttonDecoration})
      : assert((buttonSize ?? 60) <= (height)),
        super(key: key);

  @override
  _FlutterSlideState createState() => _FlutterSlideState();
}

class _FlutterSlideState extends State<FlutterSlide> {
  late bool flag;

  @override
  void initState() {
    super.initState();
    flag = true;
  }

  @override
  Widget build(BuildContext context) {
    return flag == true
        ? _control()
        : widget.dismissible == true
            ? Container()
            : _control();
  }

  Widget _control() => Container(
        height: widget.height,
        width: widget.width,
        decoration: widget.decoration == null
            ? BoxDecoration(
                color: widget.disable
                    ? Colors.grey.shade700
                    : widget.backgroundColor)
            : widget.decoration!.copyWith(
                color: widget.disable
                    ? Colors.grey.shade700
                    : widget.backgroundColor),
        alignment: Alignment.centerLeft,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              alignment: widget.alignLabel,
              child: widget.shimmer && !widget.disable
                  ? Shimmer.fromColors(
                      baseColor:
                          widget.disable ? Colors.grey : widget.baseColor,
                      highlightColor: widget.highlightedColor,
                      child: widget.label ?? Text(''),
                    )
                  : widget.label,
            ),
            widget.disable
                ? Tooltip(
                    verticalOffset: 50,
                    message: 'Button is disabled',
                    child: Container(
                      width: widget.width,
                      height: widget.height,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                        left: (widget.height -
                                (widget.buttonSize ?? widget.height * 0.9)) /
                            2,
                      ),
                      child: Container(
                        height: widget.buttonSize ?? widget.height,
                        width: widget.buttonSize ?? widget.height,
                        decoration: widget.disabledButtonDecoration ??
                            BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(widget.radius)),
                        child: Center(child: widget.child),
                      ),
                    ),
                  )
                : Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.startToEnd,
                    dismissThresholds: {
                      DismissDirection.startToEnd: widget.dismissThresholds
                    },

                    ///gives direction of swiping in argument.
                    onDismissed: (dir) async {
                      setState(() {
                        if (widget.dismissible) {
                          flag = false;
                        } else {
                          flag = !flag;
                        }
                      });

                      widget.action();
                    },
                    child: Container(
                      width: widget.width,
                      height: widget.height,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                        left: (widget.height -
                                (widget.buttonSize == null
                                    ? widget.height
                                    : widget.buttonSize!)) /
                            2,
                      ),
                      child: Container(
                        height: widget.buttonSize,
                        width: widget.buttonSize,
                        decoration: widget.buttonDecoration,
                        child: widget.child,
                      ),
                    ),
                  ),
          ],
        ),
      );
}
