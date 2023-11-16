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
      padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
      child: SizedBox(
        height: 70,
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                height: 10,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [ColorsStyles.i.hogwartsBlack, ColorsStyles.i.hogwartsGold]),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 10,
                    height: 50,
                    decoration: BoxDecoration(color: ColorsStyles.i.hogwartsBlack),
                  ),
                  Text(
                    spell.name,
                    style: TextStyles.i.textBold.copyWith(color: ColorsStyles.i.hogwartsBlack, fontSize: 25),
                  ),
                  Container(
                    width: 10,
                    height: 50,
                    decoration: BoxDecoration(color: ColorsStyles.i.hogwartsGold),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 10,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [ColorsStyles.i.hogwartsBlack, ColorsStyles.i.hogwartsGold]),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
