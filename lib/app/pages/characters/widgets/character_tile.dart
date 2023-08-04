import 'package:fhp/app/core/ui/style/colors_styles.dart';
import 'package:fhp/app/core/ui/style/text_styles.dart';
import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({
    super.key,
    required this.characterName,
  });
  final String characterName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/character_detail');
        },
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    characterName,
                    style: TextStyles.i.textBold.copyWith(color: ColorsStyles.i.hogwartsBlack, fontSize: 25),
                  ),
                ),
                Text(
                  '>',
                  style: TextStyles.i.textBold.copyWith(color: ColorsStyles.i.hogwartsBlack),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
