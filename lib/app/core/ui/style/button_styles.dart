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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: ColorsStyles.i.griffindorDarkRed,
        textStyle: TextStyles.i.textBold.copyWith(color: ColorsStyles.i.griffindorYellow),
      );

  ButtonStyle get slytherinButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: ColorsStyles.i.slytherinDarkGreen,
        textStyle: TextStyles.i.textBold.copyWith(color: ColorsStyles.i.slytherinLightSilver),
      );

  ButtonStyle get ravenClawButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: ColorsStyles.i.ravenClawDarkBlue,
        textStyle: TextStyles.i.textBold.copyWith(color: ColorsStyles.i.ravenClawGold),
      );

  ButtonStyle get hufflepuffButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: ColorsStyles.i.hufflepuffYellow,
        textStyle: TextStyles.i.textBold.copyWith(color: ColorsStyles.i.hufflepuffDarkBrown),
      );

  ButtonStyle get hogwartsButton => ElevatedButton.styleFrom(
        elevation: 30,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: ColorsStyles.i.hogwartsBlack,
        textStyle: TextStyles.i.textButtomLabel.copyWith(color: ColorsStyles.i.hogwartsGold),
      );
}

extension ButtonStylesExtension on BuildContext {
  ButtonStyles get button => ButtonStyles.i;
}
