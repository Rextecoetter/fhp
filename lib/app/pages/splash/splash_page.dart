import 'package:fhp/app/core/ui/helper/size_extension.dart';
import 'package:fhp/app/core/ui/style/button_styles.dart';
import 'package:fhp/app/core/ui/widgets/app_default_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/splash01.jpg',
            width: context.screenWidth,
            height: context.screenHeight,
            fit: BoxFit.fitHeight,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppDefaultButton(
                      style: ButtonStyles.i.hogwartsButton,
                      label: 'Portugues',
                      onPressed: () {
                        Navigator.of(context).pushNamed('/inicial');
                      },
                    ),
                    AppDefaultButton(
                      style: ButtonStyles.i.hogwartsButton,
                      label: 'English',
                      onPressed: () {
                        Navigator.of(context).pushNamed('/inicial');
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}
