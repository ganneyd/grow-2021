import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state.freezed.dart';

///
enum LoginStateStatus {
  ///Initial state
  unknown,

  ///The login form is being submitted
  submissionInProgress,

  ///The form was submitted without errors
  submittedSuccessfully,

  ///The form was submitted with errors

  submittedUnsuccessfully
}

@freezed
class LoginPageState with _$LoginPageState {
  /// ;
  factory LoginPageState({
    String? error,
    @Default(LoginStateStatus.unknown) LoginStateStatus status,
  }) = _LoginPageState;
}
