import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/user_login.dart';
import 'package:grow_run_v1/features/grow/presentation/pages/login/cubit/login_state.dart';

///The Login Page cubit
class LoginPageCubit extends Cubit<LoginPageState> {
  ///
  LoginPageCubit({
    required AuthenticationRepository authenticationRepository,
  })   : _loginUser = LoginUser(authenticationRepository),
        super(LoginPageState());

  final LoginUser _loginUser;

  ///Log the user in
  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: LoginStateStatus.submissionInProgress));
    final Either<Failure, void> result =
        await _loginUser.call(Params(email: email, password: password));

    emit(result.fold(
        (Failure failure) => state.copyWith(
            error: failure.message,
            status: LoginStateStatus.submittedUnsuccessfully),
        (_) => state.copyWith(status: LoginStateStatus.submittedSuccessfully)));
  }


}
