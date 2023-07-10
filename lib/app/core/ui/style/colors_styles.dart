import 'package:flutter/material.dart';

class ColorsStyles {
  static ColorsStyles? _instance;
  ColorsStyles._();

  static ColorsStyles get i {
    _instance ??= ColorsStyles._();
    return _instance!;
  }

  Color get griffindorDarkRed => const Color(0XFF740001);
  Color get griffindorRed => const Color(0XFFAE0001);
  Color get griffindorYellow => const Color(0XFFEEBA30);
  Color get griffindorGold => const Color(0XFFD3A625);
  Color get slytherinDarkGreen => const Color(0XFF1A472A);
  Color get slytherinGreen => const Color(0XFF2A623D);
  Color get slytherinDarkSilver => const Color(0XFF5D5D5D);
  Color get slytherinLightSilver => const Color(0XFFAAAAAA);
  Color get ravenClawDarkBlue => const Color(0XFF0E1A40);
  Color get ravenClawBlue => const Color(0XFF222F5B);
  Color get ravenClawGrey => const Color(0XFFBEBEBE);
  Color get ravenClawGold => const Color(0XFF946B2D);
  Color get hufflepuffYellow => const Color(0XFFECB939);
  Color get hufflepuffLightYellow => const Color(0XFFF0C75E);
  Color get hufflepuffLghtBrown => const Color(0XFF726255);
  Color get hufflepuffDarkBrown => const Color(0XFF372E29);
  Color get hogwartsGold => const Color(0XFFB3984D);
  Color get hogwartsBlack => const Color(0XFF261C0F);
}

extension ColorsStyleExstension on BuildContext {
  ColorsStyles get colors => ColorsStyles.i;
}
