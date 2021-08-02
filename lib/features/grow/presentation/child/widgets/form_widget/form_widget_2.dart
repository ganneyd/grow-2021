import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/data/models/school/school_model.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/default_ui_elements.dart';
import 'package:reactive_forms/reactive_forms.dart';

///
class ChildSignUpFormTwo extends StatelessWidget {
  ///
  const ChildSignUpFormTwo({required this.schools, required this.formGroup})
      : super(key: const Key('child-sign-up-form-2'));

  ///The list of schools that will be presented to the user
  final List<SchoolModel> schools;

  ///Tghe formgroup that controls the reactive form
  final FormGroup formGroup;

  @override
  Widget build(BuildContext context) {
    return DefaultUIElements.getDefaultPaddingContainer(
        child: ReactiveFormBuilder(
            form: () => formGroup,
            builder: (BuildContext context, FormGroup form, Widget? child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: ReactiveTextField<int>(
                      formControlName: 'age',
                      decoration: const InputDecoration(hintText: 'Age'),
                    ),
                  ),
                  DefaultUIElements.getDefaultFormPadding(),
                  Flexible(
                      child: ReactiveDropdownField<SchoolModel>(
                          formControlName: 'school',
                          items: schools.map((SchoolModel e) {
                            return DropdownMenuItem<SchoolModel>(
                              value: e,
                              child: Text(e.name),
                            );
                          }).toList())),
                  DefaultUIElements.getDefaultFormPadding(),
                  Flexible(
                      child: ReactiveTextField<int>(
                    formControlName: 'gradeLevel',
                    decoration: const InputDecoration(hintText: 'Grade Level'),
                  )),
                ],
              );
            }));
  }
}
