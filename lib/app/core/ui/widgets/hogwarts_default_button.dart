import 'package:fhp/app/core/ui/helper/size_extension.dart';
import 'package:flutter/material.dart';

import '../style/button_styles.dart';

class HogwartsDefaultButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;

  const HogwartsDefaultButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 42.0,
        maxWidth: 158.0,
      ),
      child: SizedBox(
        height: height ?? context.percentHeight(.05),
        width: width ?? context.percentWidth(.4),
        child: ElevatedButton(
          style: ButtonStyles.i.hogwartsButton,
          onPressed: onPressed,
          child: Text(label),
        ),
      ),
    );
  }
}
