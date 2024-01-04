import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Padding addPadding(EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Container addMargin(EdgeInsets margin) {
    return Container(
      margin: margin,
      child: this,
    );
  }
}
