import 'package:fhp/app/core/ui/style/colors_styles.dart';
import 'package:fhp/app/core/ui/style/text_styles.dart';
import 'package:fhp/app/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({
    super.key,
    required this.character,
    required this.colors,
  });
  final CharacterModel character;
  final List<Color> colors;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            '/character_detail',
            arguments: character,
          );
        },
        child: SizedBox(
          height: 56,
          width: double.infinity,
          child: Container(
            height: 56,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [colors[0], colors[1]]),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        ColorsStyles.i.hogwartsBlack.withOpacity(0.2),
                        ColorsStyles.i.hogwartsGold,
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            character.name,
                            style: TextStyles.i.textBold.copyWith(color: ColorsStyles.i.hogwartsBlack, fontSize: 25),
                          ),
                        ),
                        Text(
                          '>',
                          style: TextStyles.i.textBold.copyWith(color: ColorsStyles.i.hogwartsBlack),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 10,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [colors[2], colors[3]]),
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
      ),
    );
  }
}
