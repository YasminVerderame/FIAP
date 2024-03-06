import 'package:flutter/material.dart';

const double borderWidth = 2.0;

const Radius radius = Radius.circular(6.0);
const BorderRadius borderRadius = BorderRadius.all(radius);

BoxDecoration borderCard(Color color) {
  return BoxDecoration(
    color: color,
    border: Border.all(
      color: color,
      width: borderWidth,
    ),
    borderRadius: borderRadius,
  );
}

InputBorder inputBorder(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
      width: borderWidth,
    ),
    borderRadius: borderRadius,
  );
}

RoundedRectangleBorder shapeBorder(Color color) {
  return RoundedRectangleBorder(
    side: BorderSide(
      color: color,
      width: borderWidth,
    ),
    borderRadius: borderRadius,
  );
}

BoxDecoration borderDialog(Color color) {
  return BoxDecoration(
    color: color,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(6.0),
      topRight: Radius.circular(6.0),
    ),
  );
}
