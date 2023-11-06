import 'package:fhp/app/core/ui/style/colors_styles.dart';
import 'package:fhp/app/core/ui/style/text_styles.dart';
import 'package:fhp/app/models/spell_model.dart';
import 'package:flutter/material.dart';

class SpellTile extends StatelessWidget {
  const SpellTile({required this.spell, super.key});

  final SpellModel spell;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [ColorsStyles.i.hogwartsBlack.withOpacity(1), ColorsStyles.i.hogwartsGold.withOpacity(.2)]),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
            ),
            Text(
              spell.name,
              style: TextStyles.i.textBold.copyWith(color: ColorsStyles.i.hogwartsBlack, fontSize: 25),
            ),
            Container(
              width: double.infinity,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
