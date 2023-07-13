import 'package:fhp/app/core/ui/helper/loader.dart';
import 'package:fhp/app/core/ui/style/colors_styles.dart';
import 'package:fhp/app/core/ui/style/text_styles.dart';
import 'package:fhp/app/pages/characters/character_state.dart';
import 'package:fhp/app/pages/characters/characters_controller.dart';
import 'package:fhp/app/pages/characters/widgets/search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../core/ui/helper/messages.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> with Loader, Messages {
  TextEditingController characterNameEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<CharactersController>().loadCharacters();
    });
  }

  @override
  void dispose() {
    characterNameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/default_background.jpg'), fit: BoxFit.fitHeight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Personagens',
            style: TextStyles.i.textTitleLabel.copyWith(color: ColorsStyles.i.hogwartsBlack),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Center(
            child: BlocConsumer<CharactersController , CharacterState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Form(
                      key: formKey,
                      child: SearchTextFormField(tec: characterNameEC),
                    ),
                    //Expanded(child: child)
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
