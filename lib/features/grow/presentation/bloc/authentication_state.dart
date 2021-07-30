part of 'authentication_bloc.dart';

///Different auth states the app can be in
enum AuthenticationStatus {
  ///waiting to see if the user is authenticated or not on app start up;
  uninitialized,

  ///when a user is aunthenticated but its type isn't known
  authenticated,

  ///a child user is authenticated
  childAuthenticated,

  /// when a parent user is authenticated
  parentAuthenticated,

  ///when any user is not aunthenticated
  unauthenticated,
}

///Exposes methods to return if the state is of a particular Authentication
///state
extension StateStatusExtension on AuthenticationStatus {
  ///if the state is authenticated
  bool isAuthenticated() => this == AuthenticationStatus.authenticated;

  ///if the state has a parent that is authenticated
  bool isChildAuthenticated() =>
      this == AuthenticationStatus.childAuthenticated;

  ///if the state has a parent that is authenticated
  bool isParentAuthenticated() =>
      this == AuthenticationStatus.parentAuthenticated;

  ///if the state is unauthenticated
  bool isUnauthenticated() => this == AuthenticationStatus.unauthenticated;

  ///if the state is uninitialized
  bool isUninitialized() => this == AuthenticationStatus.uninitialized;
}

///
class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.uninitialized,
    this.user = UserEntity.empty,
  });

  ///when a user is successfully authenticated
  AuthenticationState.authenticated(UserEntity user)
      : this._(
            status: user.userType.isChild()
                ? AuthenticationStatus.childAuthenticated
                : user.userType.isParent()
                    ? AuthenticationStatus.parentAuthenticated
                    : AuthenticationStatus.authenticated,
            user: user);

  ///
  const AuthenticationState.uninitialized() : this._();

  ///when a user log outs or timesout
  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  ///The current auth status
  final AuthenticationStatus status;

  ///the
  final UserEntity user;

  @override
  List<Object> get props => <Object>[status, user];
}
