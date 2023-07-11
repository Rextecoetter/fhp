import 'package:fhp/app/core/ui/style/colors_styles.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin Loader<T extends StatefulWidget> on State<T> {
  var isOpen = false;

  void showLoader(Color? leftDotColor, Color? rightDotColor) {
    if (!isOpen) {
      isOpen = true;
      showDialog(
          context: context,
          builder: (context) {
            return LoadingAnimationWidget.flickr(
              leftDotColor: leftDotColor ?? ColorsStyles.i.hogwartsBlack,
              rightDotColor: rightDotColor ?? ColorsStyles.i.hogwartsGold,
              size: 60,
            );
          });
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }
}
