import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/authentication/reset_password.dart';
import 'package:grow_run_v1/features/grow/presentation/pages/forgot_password/cubit/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordPageState> {
  ResetPasswordCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _resetPassword =
            ResetPassword(authenticationRepository: authenticationRepository),
        super(ResetPasswordPageState());
  final ResetPassword _resetPassword;

  ///Reset the user's password via a email link
  Future<void> resetPassword(String email) async {
    emit(state.copyWith(status: ResetPasswordStatus.sendingResetLink));
    final Either<Failure, void> results =
        await _resetPassword.call(Params(email: email));

    emit(results.fold(
        (Failure failure) => state.copyWith(
            status: ResetPasswordStatus.resetLinkSentUnsuccessfully),
        (_) => state.copyWith(
            status: ResetPasswordStatus.resetLinkSentSuccessfully)));
  }
}
