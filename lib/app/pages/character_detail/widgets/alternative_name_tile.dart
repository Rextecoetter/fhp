import 'package:fhp/app/core/ui/style/text_styles.dart';
import 'package:flutter/material.dart';

class AlternativeNameTile extends StatelessWidget {
  const AlternativeNameTile({
    super.key,
    required this.alternateNames,
    required this.textColor,
  });

  final Color textColor;
  final List<String> alternateNames;

  @override
  Widget build(BuildContext context) {
    return _getBody();
  }

  _getBody() {
    if (alternateNames.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: alternateNames
            .map((e) => Text(
                  e,
                  style: TextStyles.i.textBold.copyWith(fontSize: 30, color: textColor),
                ))
            .toList(),
      );
    }
    return Text('Não possui',
        style: TextStyles.i.textBold.copyWith(
          fontSize: 30,
          color: textColor,
        ));
  }
}
