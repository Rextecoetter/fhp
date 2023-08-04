import 'package:fhp/app/pages/characters/character_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/ui/style/button_styles.dart';
import '../../../core/ui/widgets/app_default_button.dart';
import '../characters_controller.dart';

class ModalBottonSheetFilter extends StatelessWidget {
  const ModalBottonSheetFilter({super.key, required this.state});

  final CharacterState state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppDefaultButton(
            style: ButtonStyles.i.griffindorButton,
            label: 'Alunos de Grifinoria',
            width: 300,
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil('/characters',  ModalRoute.withName('/inicial'));
              // context
              //     .read<CharactersController>()
              //     .getFilteredByHouse(characterModelList: state.characters, house: 'Gryffindor');
              // Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          AppDefaultButton(
            style: ButtonStyles.i.slytherinButton,
            label: 'Alunos de Sonserina',
            width: 300,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          AppDefaultButton(
            style: ButtonStyles.i.ravenClawButton,
            label: 'Alunos de Corvinal',
            width: 300,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          AppDefaultButton(
            style: ButtonStyles.i.hufflepuffButton,
            label: 'Alunos de Lufa Lufa',
            width: 300,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          AppDefaultButton(
            style: ButtonStyles.i.hogwartsButton,
            label: 'Staff de Hogwarts',
            width: 300,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          AppDefaultButton(
            style: ButtonStyles.i.hogwartsButton,
            label: 'Todos os Personagens',
            width: 300,
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
