import 'package:flutter/material.dart';

extension StringExtensions on String {
  double width () => (
    TextPainter(
      text: TextSpan(
        text: this,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout()).size.width + 40;
}