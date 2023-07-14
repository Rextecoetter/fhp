import 'package:fhp/app/core/ui/helper/size_extension.dart';
import 'package:flutter/material.dart';

class AppDefaultButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final ButtonStyle style;

  const AppDefaultButton({
    super.key,
    required this.style,
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
        maxWidth: 300.0,
      ),
      child: SizedBox(
        height: height ?? context.percentHeight(.05),
        width: width ?? context.percentWidth(.4),
        child: ElevatedButton(
          style: style,
          onPressed: onPressed,
          child: Text(label),
        ),
      ),
    );
  }
}
