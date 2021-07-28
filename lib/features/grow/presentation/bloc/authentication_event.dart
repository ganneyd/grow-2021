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

  ///user enity returned from the auth repo
  final UserEntity user;

  @override
  List<Object> get props => <Object>[user];
}

///
class AuthenticationLogoutRequested extends AuthenticationEvent {}
