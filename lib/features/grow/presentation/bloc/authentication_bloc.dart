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
  })  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.uninitialized()) {
    _userSubscription = _authenticationRepository.user
        .listen((UserEntity user) => add(AuthenticationUserChanged(user)));
  }

  final AuthenticationRepository _authenticationRepository;
  late StreamSubscription<UserEntity> _userSubscription;

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationUserChanged) {
      print('User changed');
      final Either<Failure, UserEntity> results =
          await _authenticationRepository.getCredentials();
      yield results.fold((Failure l) {
        return _mapAuthenticationUserChangedToState(event);
      }, (UserEntity user) {
        print('The user returned from repo in bloc \n $user');
        return _mapAuthenticationUserChangedToState(
            AuthenticationUserChanged(user));
      });
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
  // Future<String> getCurrentUserUID() async {
  //   final Either<Failure, UserEntity> userEntity =
  //       await _authenticationRepository.getCredentials();

  //   return userEntity.fold((_) => Future<String>.value(UserEntity.empty.userID),
  //       (UserEntity userEntity) => Future<String>.value(userEntity.userID));
  // }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
