import 'package:fhp/app/core/ui/style/colors_styles.dart';
import 'package:fhp/app/core/ui/style/text_styles.dart';
import 'package:flutter/material.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({super.key, required this.tec});
  final TextEditingController tec;

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(7)),
    borderSide: BorderSide(
      color: ColorsStyles.i.hogwartsBlack,
      width: 5,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      maxLength: 100,
      controller: tec,
      style: TextStyles.i.textSemiBold.copyWith(fontSize: 30, color: ColorsStyles.i.hogwartsBlack),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        prefixIcon: const Icon(Icons.search),
        hintText: "Buscar Personagem",
        hintStyle: TextStyles.i.textregular.copyWith(fontSize: 25, color: ColorsStyles.i.hogwartsBlack),
        border: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
      ),
    );
  }
}
