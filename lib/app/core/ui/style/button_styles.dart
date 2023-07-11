import 'package:fhp/app/core/ui/style/colors_styles.dart';
import 'package:fhp/app/core/ui/style/text_styles.dart';
import 'package:flutter/material.dart';

class ButtonStyles {
  static ButtonStyles? _instance;
  ButtonStyles._();

  static ButtonStyles get i {
    _instance ??= ButtonStyles._();
    return _instance!;
  }

  ButtonStyle get griffindorButton => ElevatedButton.styleFrom(
        elevation: 30,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: ColorsStyles.i.griffindorDarkRed,
        foregroundColor: ColorsStyles.i.griffindorYellow,
        textStyle: TextStyles.i.textButtomLabel,
      );

  ButtonStyle get slytherinButton => ElevatedButton.styleFrom(
        elevation: 30,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: ColorsStyles.i.slytherinDarkGreen,
        foregroundColor: ColorsStyles.i.slytherinLightSilver,
        textStyle: TextStyles.i.textButtomLabel,
      );

  ButtonStyle get ravenClawButton => ElevatedButton.styleFrom(
        elevation: 30,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: ColorsStyles.i.ravenClawDarkBlue,
        foregroundColor: ColorsStyles.i.ravenClawGold,
        textStyle: TextStyles.i.textButtomLabel,
      );

  ButtonStyle get hufflepuffButton => ElevatedButton.styleFrom(
        elevation: 30,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: ColorsStyles.i.hufflepuffYellow,
        foregroundColor: ColorsStyles.i.hufflepuffDarkBrown,
        textStyle: TextStyles.i.textButtomLabel,
      );

  ButtonStyle get hogwartsButton => ElevatedButton.styleFrom(
        elevation: 30,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: ColorsStyles.i.hogwartsBlack,
        foregroundColor: ColorsStyles.i.hogwartsGold,
        textStyle: TextStyles.i.textButtomLabel,
      );
}

extension ButtonStylesExtension on BuildContext {
  ButtonStyles get button => ButtonStyles.i;
}
