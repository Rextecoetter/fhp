import 'package:fhp/app/core/ui/helper/loader.dart';
import 'package:fhp/app/core/ui/helper/messages.dart';
import 'package:fhp/app/core/ui/style/colors_styles.dart';
import 'package:fhp/app/core/ui/style/text_styles.dart';
import 'package:fhp/app/pages/spell/spell_controller.dart';
import 'package:fhp/app/pages/spell/spell_state.dart';
import 'package:fhp/app/pages/spell/widgets/spell_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpellPage extends StatefulWidget {
  const SpellPage({super.key});

  @override
  State<SpellPage> createState() => _SpellPageState();
}

class _SpellPageState extends State<SpellPage> with Loader, Messages {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<SpellController>().loadSpells();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/default_background.jpg'), fit: BoxFit.fitHeight)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Magias',
            style: TextStyles.i.textTitleLabel.copyWith(color: ColorsStyles.i.hogwartsBlack),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Center(
            child: BlocConsumer<SpellController, SpellState>(
              listener: (context, state) {
                switch (state.status) {
                  case SpellStateStatus.loading:
                    showLoader(ColorsStyles.i.hogwartsBlack, ColorsStyles.i.hogwartsGold);
                  case _:
                    hideLoader();
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      itemCount: state.spellList.length,
                      itemBuilder: (context, index) {
                        return SpellTile(
                          spell: state.spellList[index],
                        );
                      },
                    ))
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
