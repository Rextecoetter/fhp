import 'package:fhp/app/core/ui/helper/loader.dart';
import 'package:fhp/app/core/ui/helper/messages.dart';
import 'package:fhp/app/core/ui/style/colors_styles.dart';
import 'package:fhp/app/core/ui/style/text_styles.dart';
import 'package:fhp/app/pages/spell/spell_controller.dart';
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
        body: Container(),
      ),
    );
  }
}
