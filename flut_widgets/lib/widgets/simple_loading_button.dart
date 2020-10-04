import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SimpleLoadingButton extends StatelessWidget {
  const SimpleLoadingButton({
    Key key,
    @required this.onPressed,
    @required this.child,
    this.shape,
    this.height,
    this.minWidth,
    this.busy,
    this.color,
    this.loadingColor,
  }) : super(key: key);

  final VoidCallback onPressed;

  final ShapeBorder shape;

  final Widget child;

  final double height;

  final double minWidth;

  final bool busy;

  final Color color;
  final Color loadingColor;

  Widget _getChild(BuildContext context) {
    if (busy == true) {
      return SpinKitThreeBounce(
        color: loadingColor ?? Colors.white,
        size: 24,
      );
    }
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: busy == true,
      child: FlatButton(
        onPressed: onPressed,
        child: _getChild(context),
        color: color ?? Theme.of(context).primaryColor,
        shape: shape,
        height: height ?? 45,
        minWidth: minWidth,
      ),
    );
  }
}
