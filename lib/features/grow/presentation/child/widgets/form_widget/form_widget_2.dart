import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/data/models/school/school_model.dart';
import 'package:grow_run_v1/features/grow/presentation/child/widgets/form_group/sign_up_form_group.dart';
import 'package:reactive_forms/reactive_forms.dart';

///
class ChildSignUpFormTwo extends StatelessWidget {
  ///
  const ChildSignUpFormTwo({required this.schools})
      : super(key: const Key('child-sign-up-form-2'));
  final List<DropdownMenuItem<SchoolModel>> schools;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
        formGroup: ChildSignUpForm.buildChildSignUpPage2(min: 0, max: 12),
        child: Column(
          children: <Widget>[
            ReactiveTextField<int>(
              formControlName: 'age',
            ),
            ReactiveDropdownField<SchoolModel>(
                formControlName: 'school', items: schools),
            ReactiveTextField<int>(
              formControlName: 'grade_level',
            ),
          ],
        ));
  }
}
