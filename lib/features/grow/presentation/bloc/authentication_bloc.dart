import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:pedantic/pedantic.dart';
part 'authentication_state.dart';
part 'authentication_event.dart';

///
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  // ignore: public_member_api_docs
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  })   : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.uninitialized()) {
    _userSubscription = _authenticationRepository.user
        .listen((UserEntity user) => add(AuthenticationUserChanged(user)));
  }

  final AuthenticationRepository _authenticationRepository;
  late StreamSubscription<UserEntity> _userSubscription;

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    print('i was called');
    if (event is AuthenticationUserChanged) {
      yield _mapAuthenticationUserChangedToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      unawaited(_authenticationRepository.signOutUser());
    }
  }

  AuthenticationState _mapAuthenticationUserChangedToState(
      AuthenticationUserChanged event) {
    print(event.user.userID);
    print(event.user.name);
    print(event.user.userType);
    print(event.user.userEmail);
    print('map auth chan');
    return event.user != UserEntity.empty
        ? AuthenticationState.authenticated(event.user)
        : const AuthenticationState.unauthenticated();
  }

  ///Returns the user id of the authenticated user
  Future<String> getCurrentUserUID() async {
    final Either<Failure, UserEntity> userEntity =
        await _authenticationRepository.getAuthenticatedUser();

    final UserEntity userModel = userEntity.getOrElse(() => UserEntity.empty);

    return userModel.userID;
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
