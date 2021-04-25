part of 'authentication_bloc.dart';

///
abstract class AuthenticationEvent extends Equatable {
  ///
  const AuthenticationEvent();
  @override
  List<Object> get props => <Object>[];
}

///
class AuthenticationUserChanged extends AuthenticationEvent {
  ///
  const AuthenticationUserChanged(this.user);

  final UserEntity user;

  @override
  List<Object> get props => [user];
}

///
class AuthenticationLogoutRequested extends AuthenticationEvent {}
