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
    required this.value,
    required this.onFemalePressed,
    required this.onMalePressed,
  }) : super(key: const Key('gender_input'));

  /// the value of the user's selection
  final Gender value;

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
            child: Image.asset(
              'assets/avatar/male/male.png',
              height: 3000,
              filterQuality: FilterQuality.high,
              fit: BoxFit.fitWidth,
            ),
          ),
          Flexible(
              child: IconButton(
            icon: const FaIcon(FontAwesomeIcons.female),
            color: value.isFemale()
                ? girlGender.withOpacity(1)
                : girlGender.withOpacity(0.5),
            iconSize: 150,
            onPressed: onFemalePressed,
          )),
        ],
      );
    });
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
                  value: EnumToString.fromString(Gender.values, field.value!) ??
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
