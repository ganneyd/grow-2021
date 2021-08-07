import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/data/models/school/school_model.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/default_ui_elements.dart';
import 'package:reactive_forms/reactive_forms.dart';

///
class ChildSignUpFormTwo extends StatelessWidget {
  ///
  ChildSignUpFormTwo({required this.schools, required this.formGroup})
      : super(key: const Key('child-sign-up-form-2'));

  ///The list of schools that will be presented to the user
  final List<SchoolModel> schools;

  ///The form group that controls the reactive form
  final FormGroup formGroup;

  ///List of the form group inputs
  final List<Widget> _formInputs = <Widget>[
    ReactiveTextField<int>(
      formControlName: 'age',
      decoration: const InputDecoration(hintText: 'Age'),
    ),
    ReactiveTextField<int>(
      formControlName: 'gradeLevel',
      decoration: const InputDecoration(hintText: 'Grade Level'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    _formInputs.insert(
      1,
      ReactiveDropdownField<SchoolModel>(
          formControlName: 'school',
          items: schools.map((SchoolModel e) {
            return DropdownMenuItem<SchoolModel>(
              value: e,
              child: Text(e.name),
            );
          }).toList()),
    );
    return ReactiveFormBuilder(
        form: () => formGroup,
        builder: (BuildContext context, FormGroup form, Widget? child) {
          return ListView.separated(
            itemCount: _formInputs.length,
            itemBuilder: (BuildContext context, int items) {
              return _formInputs[items];
            },
            separatorBuilder: (BuildContext context, int items) =>
                const SizedBox(
              height: 30,
            ),
          );
        });
  }
}
