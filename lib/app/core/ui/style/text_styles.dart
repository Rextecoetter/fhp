import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;
  TextStyles._();

  static TextStyles get i {
    _instance ??= TextStyles._();
    return _instance!;
  }

  String get font => 'hp';

  TextStyle get textLight => TextStyle(fontWeight: FontWeight.w300, fontFamily: font);
  TextStyle get textregular => TextStyle(fontWeight: FontWeight.normal, fontFamily: font);
  TextStyle get textMedium => TextStyle(fontWeight: FontWeight.w500, fontFamily: font);
  TextStyle get textSemiBold => TextStyle(fontWeight: FontWeight.w600, fontFamily: font);
  TextStyle get textBold => TextStyle(fontWeight: FontWeight.bold, fontFamily: font);
  TextStyle get textExtraBold => TextStyle(fontWeight: FontWeight.w800, fontFamily: font);
  TextStyle get textButtomLabel => textBold.copyWith(fontSize: 30);
  TextStyle get textTitleLabel => textExtraBold.copyWith(fontSize: 40);
}

extension TextStyleExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
