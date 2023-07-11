import 'package:fhp/app/core/ui/helper/size_extension.dart';
import 'package:flutter/material.dart';

import '../style/button_styles.dart';

class HogwartsDefaultButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const HogwartsDefaultButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.percentHeight(.05),
      width: context.percentWidth(.4),
      child: ElevatedButton(
        style: ButtonStyles.i.hogwartsButton,
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
