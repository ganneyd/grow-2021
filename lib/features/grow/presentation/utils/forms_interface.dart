import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

///a way for all reactive forms to provide thier form group so that they can be
///accessed by other widgets to determine if the form is valid or not

abstract class ReactiveFormGroup extends StatelessWidget {
  ///
  const ReactiveFormGroup({Key? key}) : super(key: key);

  ///returns the form group for this form

  FormGroup get reactiveFormGroup;
}
