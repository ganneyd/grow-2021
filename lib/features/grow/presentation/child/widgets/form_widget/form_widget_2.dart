import 'package:flutter/material.dart';
import 'package:grow_run_v1/features/grow/data/models/school/school_model.dart';
import 'package:grow_run_v1/features/grow/presentation/child/widgets/form_group/sign_up_form_group.dart';
import 'package:grow_run_v1/features/grow/presentation/utils/forms_interface.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/default_ui_elements.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/form_group/get_form_validators.dart';
import 'package:reactive_forms/reactive_forms.dart';

///
class ChildSignUpFormTwo extends ReactiveFormGroup
    implements GetFormValidation {
  ///
  ChildSignUpFormTwo({required this.schools})
      : super(key: const Key('child-sign-up-form-2'));
  final List<SchoolModel> schools;
  final FormGroup _formGroup = ChildSignUpForm.buildChildSignUpPage2(
      minAge: 7, maxAge: 17, min: 0, max: 12);
  @override
  Widget build(BuildContext context) {
    return DefaultUIElements.getDefaultPaddingContainer(
        child: ReactiveFormBuilder(
            form: () => _formGroup,
            builder: (context, form, child) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: ReactiveTextField<int>(
                      formControlName: 'age',
                      decoration: const InputDecoration(hintText: 'Age'),
                    ),
                  ),
                  DefaultUIElements.getDefaultFormPadding(),
                  Expanded(
                      child: ReactiveDropdownField<SchoolModel>(
                          formControlName: 'school',
                          items: schools.map((SchoolModel e) {
                            return DropdownMenuItem<SchoolModel>(
                              value: e,
                              child: Text(e.name),
                            );
                          }).toList())),
                  DefaultUIElements.getDefaultFormPadding(),
                  Expanded(
                      child: ReactiveTextField<int>(
                    formControlName: 'grade_level',
                    decoration: const InputDecoration(hintText: 'Grade Level'),
                  )),
                ],
              );
            }));
  }

  @override
  FormGroup get reactiveFormGroup => _formGroup;

  @override
  bool isValid() {
    // TODO: implement isValid
    throw UnimplementedError();
  }
}
