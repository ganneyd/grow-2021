import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grow_run_v1/core/util/util.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/default_ui_elements.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:enum_to_string/enum_to_string.dart';

///Displays a female and male icon for the user to choose from to specify thier
///gender
class GenderInput extends StatelessWidget {
  ///
  const GenderInput({
    required this.gender,
    required this.onFemalePressed,
    required this.onMalePressed,
  }) : super(key: const Key('gender_input'));

  /// the value of the user's selection
  final Gender gender;

  ///The callback to notify that the user selected the male gender
  final VoidCallback onMalePressed;

  ///The callback to notify that the user selected the male gender
  final VoidCallback onFemalePressed;

  ///

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        children: [
          Expanded(
              child: GestureDetector(
                  onTap: onMalePressed,
                  child: _getGenderBtn(
                      filename: 'assets/avatar/male/male.png',
                      opacity: gender.isMale() ? 1 : 0.45))),
          Expanded(
              child: GestureDetector(
                  onTap: onFemalePressed,
                  child: _getGenderBtn(
                      filename: 'assets/avatar/female/female.png',
                      opacity: gender.isFemale() ? 1 : 0.45))),
        ],
      );
    });
  }

//returns the gender button which is a image with a color
  ///TODO: add dropshadow to image
  Widget _getGenderBtn({required String filename, required double opacity}) {
    return Image.asset(
      filename,
      height: 250,
      filterQuality: FilterQuality.high,
      fit: BoxFit.fitHeight,
      color: Colors.black.withOpacity(opacity),
      colorBlendMode: BlendMode.dstIn,
    );
  }
}

///Turns the GenderInput into a Reactive Gender Input for use with the
///reactive forms package
class ReactiveGenderInput extends ReactiveFormField<String, String> {
  ///
  ReactiveGenderInput({
    required String formControlName,
  }) : super(
            formControlName: formControlName,
            builder: (ReactiveFormFieldState<String, String> field) {
              return GenderInput(
                  gender:
                      EnumToString.fromString(Gender.values, field.value!) ??
                          Gender.unknown,
                  onFemalePressed: () => field
                      .didChange(EnumToString.convertToString(Gender.female)),
                  onMalePressed: () => field
                      .didChange(EnumToString.convertToString(Gender.male)));
            });
  @override
  ReactiveFormFieldState<String, String> createState() =>
      ReactiveFormFieldState<String, String>();
}
