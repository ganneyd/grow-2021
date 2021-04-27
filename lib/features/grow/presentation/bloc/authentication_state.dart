part of 'authentication_bloc.dart';

///Different auth states the app can be in
enum AuthenticationStatus {
  ///when a user is aunthenticated but its type isn't known
  authenticated,

  ///a child user is authenticated
  childAuthenticated,

  /// when a parent user is authenticated
  parentAuthenticated,

  ///when any user is not aunthenticated
  unauthenticated,

  ///the auth state is currently not known
  unknown
}

///
class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = UserEntity.empty,
  });

  ///When the auth isnt known
  const AuthenticationState.unknown() : this._();

  ///when a user is successfully authenticated
  AuthenticationState.authenticated(UserEntity user)
      : this._(
            status: user.userType == UserType.child
                ? AuthenticationStatus.childAuthenticated
                : user.userType == UserType.parent
                    ? AuthenticationStatus.parentAuthenticated
                    : AuthenticationStatus.authenticated,
            user: user);

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
