// ignore_for_file: public_member_api_docs
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

enum FORM_INPUT_NAMES {
  age,
  cPassword,
  email,
  fName,
  gender,
  gradeLevel,
  lName,
  password,
  phoneNumber,
  school,
  username,
}

///[T] is the type of data that will be input by the user
abstract class FormInputControl {
  String getErrorMsg();
  String getValue();
}

///Implement this class to create a form input
///pass a [handler] function handle the changed value
///pass a [value] to set a default value or show the newly update value
///[helperText ] shows the user what data is being requested
///
abstract class FormInput<T> extends StatelessWidget {
  ///Construc
  const FormInput({
    required Key key,
    required this.handler,
    required this.helperText,
    required this.labelText,
    required this.formInputControl,
    required this.inputType,
  }) : super(key: key);

  final void Function(String) handler;
  final String helperText, labelText;
  final FormInputControl formInputControl;
  final TextInputType inputType;

//default input widget
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //append 'form-input' to the key to distinguish the between the
      //actual input field  and the widget
      key: Key('${key}form-input'),
      initialValue: formInputControl.getValue(),

      onChanged: (String value) => handler(value),
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: labelText,
        helperText: helperText,
        errorText: formInputControl.getErrorMsg(),
      ),
    );
  }
}
