import 'package:flutter/material.dart';

const baseFontStyle = TextStyle(
  fontStyle: FontStyle.normal,
  fontSize: 16,
);

enum TypographyType {
  header,
  title,
  body,
  label,
  caption,
}

Map<TypographyType, TextStyle> typography = {
  TypographyType.header: header,
  TypographyType.title: title,
  TypographyType.body: body,
  TypographyType.label: label,
  TypographyType.caption: caption,
};

final header = baseFontStyle.copyWith(
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

final title = baseFontStyle.copyWith(
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

final body = baseFontStyle.copyWith(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

final label = baseFontStyle.copyWith(
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

final caption = baseFontStyle.copyWith(
  fontSize: 12,
  fontWeight: FontWeight.w300,
);
