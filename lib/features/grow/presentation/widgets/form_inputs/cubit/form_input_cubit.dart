import 'package:grow_run_v1/core/util/util.dart';

// ignore_for_file: public_member_api_docs
mixin FormInputCubitMixin {
  ///  do something when the age field has changed
  void ageChanged(int value);

  ///compare the previously entered password and the confirm password field
  void confirmPasswordChanged(String value);

  ///validate the email entered
  void emailChanged(String value);
  void firstNameChanged(String value);
  void genderChanged(Gender value);
  void gradeLevelChanged(int value);

  void lastNameChanged(String value);
  void passwordChanged(String value);

  ///Pass the id of the school
  void schoolChanged(String value);

  ///TODO: Perform synchronous search in db to see if username is available
  void usernameChanged(String value);
}
