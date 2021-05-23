import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/form_status.dart';
part 'child_sign_up_state.freezed.dart';

///If the child's acc is either being  [registering] or [creating] by a user
enum SignUpMethod {
  ///Don't know atm how the child acc will be created
  unkown,

  ///Child acc is being created by another user ex. Admin, Parent
  registering,

  ///Child acc is being created by them directly
  creatingAcc
}

///
@freezed
class ChildSignUpState with _$ChildSignUpState {
  ///
  factory ChildSignUpState(
          {required Child childModel,
          String? error,
          required FormStatus status,
          @Default(SignUpMethod.unkown) SignUpMethod signUpMehtod}) =
      _ChildSignUpState;
}
