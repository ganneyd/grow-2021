import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/form_status.dart';
part 'child_sign_up_state.freezed.dart';

///
@freezed
class ChildSignUpState with _$ChildSignUpState {
  ///
  factory ChildSignUpState(
      {required Child childModel,
      String? error,
      required FormStatus status}) = _ChildSignUpState;
}
