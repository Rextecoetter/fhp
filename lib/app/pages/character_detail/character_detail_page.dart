import 'package:fhp/app/core/ui/helper/size_extension.dart';
import 'package:fhp/app/core/ui/style/text_styles.dart';
import 'package:fhp/app/models/character_model.dart';
import 'package:fhp/app/pages/character_detail/character_detail_controller.dart';
import 'package:fhp/app/pages/character_detail/character_detail_state.dart';
import 'package:fhp/app/pages/character_detail/widgets/alternative_name_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/ui/helper/loader.dart';
import '../../core/ui/helper/messages.dart';
import '../../core/ui/style/colors_styles.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({super.key});

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> with Loader, Messages {
  CharacterModel? characterModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final param = ModalRoute.of(context)?.settings.arguments as CharacterModel;
      context.read<CharacterDetailController>().initializing(param);

      setState(() {
        characterModel = param;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/default_background.jpg'), fit: BoxFit.fitHeight),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                characterModel?.name ?? '',
                style: TextStyles.i.textTitleLabel.copyWith(color: ColorsStyles.i.hogwartsBlack),
              ),
            ),
            body: BlocConsumer<CharacterDetailController, CharacterDetailState>(
              listener: (context, state) {
                switch (state.status) {
                  case CharacterDetailStateStatus.loading:
                    showLoader(ColorsStyles.i.hogwartsBlack, ColorsStyles.i.hogwartsGold);
                  case _:
                    hideLoader();
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 90,
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              gradient: LinearGradient(colors: [
                                state.colorA ?? Colors.transparent,
                                state.colorB ?? Colors.transparent,
                                state.colorC ?? Colors.transparent,
                                state.colorD ?? Colors.transparent,
                              ], begin: Alignment.bottomLeft),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 25,
                                backgroundImage: NetworkImage(state.character?.image ?? ''),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: SizedBox(
                            height: context.percentHeight(.6),
                            width: context.percentWidth(1),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Nome:',
                                          style: TextStyles.i.textBold.copyWith(fontSize: 30, color: state.colorA),
                                        ),
                                        Text(
                                          state.character?.name ?? '',
                                          style: TextStyles.i.textBold.copyWith(fontSize: 30, color: state.colorB),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Apelidos:',
                                          style: TextStyles.i.textBold.copyWith(fontSize: 30, color: state.colorA),
                                        ),
                                        AlternativeNameTile(
                                          alternateNames: state.character?.alternateNames ?? List.empty(),
                                          textColor: state.colorB ?? Colors.black,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Ator:',
                                          style: TextStyles.i.textBold.copyWith(fontSize: 30, color: state.colorA),
                                        ),
                                        Text(
                                          state.character?.actor ?? '',
                                          style: TextStyles.i.textBold.copyWith(fontSize: 30, color: state.colorB),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Casa:',
                                          style: TextStyles.i.textBold.copyWith(fontSize: 30, color: state.colorA),
                                        ),
                                        Text(
                                          state.character?.house ?? '',
                                          style: TextStyles.i.textBold.copyWith(fontSize: 30, color: state.colorB),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Especie:',
                                          style: TextStyles.i.textBold.copyWith(fontSize: 30, color: state.colorA),
                                        ),
                                        Text(
                                          state.character?.species ?? '',
                                          style: TextStyles.i.textBold.copyWith(fontSize: 30, color: state.colorB),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Bruxo:',
                                          style: TextStyles.i.textBold.copyWith(fontSize: 30, color: state.colorA),
                                        ),
                                        Text(
                                          state.character?.wizard == true ? 'Sim' : 'Não',
                                          style: TextStyles.i.textBold.copyWith(fontSize: 30, color: state.colorB),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Vivo no final:',
                                          style: TextStyles.i.textBold.copyWith(fontSize: 30, color: state.colorA),
                                        ),
                                        Text(
                                          state.character?.alive == true ? 'Sim' : 'Não',
                                          style: TextStyles.i.textBold.copyWith(fontSize: 30, color: state.colorB),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
