import 'package:freezed_annotation/freezed_annotation.dart';
part 'reset_password_state.freezed.dart';

///The different status the [ResetPasswordPageState] can have
enum ResetPasswordStatus {
  ///initial state
  unknown,

  ///the password reset link is being sent
  sendingResetLink,

  ///the link was sent to the user without any issues
  resetLinkSentSuccessfully,

  ///the link couldn't be sent to user due to an issue
  resetLinkSentUnsuccessfully,
}

///Extension on enum to provide better functionality
extension ResetPasswordStatusExtension on ResetPasswordStatus {
  ///whether or not the reset link is being sent
  bool isSending() => this == ResetPasswordStatus.sendingResetLink;

  ///if the link was sent without errors
  bool resetLinkSentSuccessfully() =>
      this == ResetPasswordStatus.resetLinkSentSuccessfully;

  ///if the link was sent with errors
  bool resetLinkSentUnsuccessfully() =>
      this == ResetPasswordStatus.resetLinkSentUnsuccessfully;
}

@freezed

///
class ResetPasswordPageState with _$ResetPasswordPageState {
  ///
  factory ResetPasswordPageState({
    @Default(ResetPasswordStatus.unknown) ResetPasswordStatus status,
  }) = _ResetPasswordPageState;
}
