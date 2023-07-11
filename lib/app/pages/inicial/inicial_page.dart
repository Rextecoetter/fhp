import 'package:fhp/app/core/ui/helper/size_extension.dart';
import 'package:fhp/app/core/ui/style/button_styles.dart';
import 'package:fhp/app/core/ui/widgets/hogwarts_default_button.dart';
import 'package:flutter/material.dart';

class InicialPage extends StatelessWidget {
  const InicialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/default_background.jpg',
          width: context.screenWidth,
          height: context.screenHeight,
          fit: BoxFit.fitHeight,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HogwartsDefaultButton(label: 'Personagens', onPressed: () {}),
              const SizedBox(
                height: 20,
              ),
              HogwartsDefaultButton(label: 'Casas', onPressed: () {}),
              const SizedBox(
                height: 20,
              ),
              HogwartsDefaultButton(label: 'Magias', onPressed: () {}),
            ],
          ),
        )
      ],
    );
  }
}
