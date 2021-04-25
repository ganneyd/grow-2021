part of 'authentication_bloc.dart';

///
enum AuthenticationStatus { authenticated, unauthenticated, unknown }

///
class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = UserEntity.empty,
  });

  ///When the auth isnt known
  const AuthenticationState.unknown() : this._();

  ///when a user is successfully authenticated
  const AuthenticationState.authenticated(UserEntity user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  ///when a user log outs or timesout
  const AuthenticationState.unauthenticated()
      : this._(
          status: AuthenticationStatus.unauthenticated,
        );

  ///The current auth status
  final AuthenticationStatus status;

  ///the
  final UserEntity user;

  @override
  List<Object> get props => <Object>[status, user];
}
