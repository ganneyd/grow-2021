import 'package:equatable/equatable.dart';

///Failure class, represents errors encountered during app use
///takes a [errmsg] that can be extracted
abstract class Failure extends Equatable {
  ///Takes the message param
  const Failure({required this.message});

  ///The error message that will be returned
  final String message;

  @override
  List<Object> get props => <Object>[];
}

// General failures

///[SignUpFailure()] handles anything relating to failures encountred while
///the user is signing up
class SignUpFailure extends Failure {
  ///Takes a error message that is then passed to the super class
  ///by default the error msg is
  ///[Unable to sign up right now, please try again later.]
  const SignUpFailure(
      {String errMsg = 'Unable to sign up right now, please try again later.'})
      : super(message: errMsg);
}

///Returned when an error is encountered when trying to authenticate an user
class AuthenticationFailure extends Failure {
  ///Takes a error message that is then passed to the super class
  ///by default the error message is
  ///[Unable to authenticate your credentials, please try again later.]
  const AuthenticationFailure(
      {String errMsg =
          'Unable to authenticate your credentials, please try again later.'})
      : super(message: errMsg);
}

///Returned when an error is encountered when trying to disable an user's
///account
class DisableFailure extends Failure {
  ///Takes a error message that is then passed to the super class
  ///by default the error message is
  ///[Unable to disable your account, please try again later.]
  const DisableFailure(
      {String errMsg =
          'Unable to disable your account, please try again later.'})
      : super(message: errMsg);
}

///Returned when an error is encountered while a user is registering
///another user
///
class RegistrationFailure extends Failure {
  ///Takes a error message that is then passed to the super class
  ///by default the error msg is
  /// [Unable to register the user right now, please try again later.]
  const RegistrationFailure(
      {String errMsg =
          'Unable to register the user right now, please try again later.'})
      : super(message: errMsg);
}

///Returned when an error is encounterd while getting data from the database
///
class FetchDataFailure extends Failure {
  ///Takes a error message that is then passed to the super class
  ///by default the error message is
  ///[Unable to retrive the document right now, please try later.]
  const FetchDataFailure(
      {String errMsg =
          'Unable to retrive the document right now, please try later.'})
      : super(message: errMsg);
}

///Returned when an error is encounter while creating data
///
class CreateDataFailure extends Failure {
  ///Takes an error message that is then passed to the super class
  ///by default the error message is
  ///[Unable to store your info in the database, please try again later.]
  const CreateDataFailure(
      {String errMsg =
          'Unable to store your info in the database, please try again later.'})
      : super(message: errMsg);
}

///Returned when an error is encounter while updating data

class UpdateDataFailure extends Failure {
  ///Takes an error message that is then passed to the super class
  ///by default the error message is
  ///[Unable to update the document right now, please try again later.]
  const UpdateDataFailure(
      {String errMsg =
          'Unable to update the document right now, please try again later.'})
      : super(message: errMsg);
}

///Returned when an error is encounter while deleting data
class DeleteDataFailure extends Failure {
  ///Takes an error message that is then passed to the super class
  ///by default the error message is
  ///[Unable to delete the document right now, please try again later.]
  const DeleteDataFailure(
      {String errMsg =
          'Unable to delete the document right now, please try again later.'})
      : super(message: errMsg);
}

///Returned when an error is encounter while checking permissions

class PermissionFailure extends Failure {
  ///Takes an error message that is then passed to the super class
  ///by default the error message is
  ///[Location permissions are permanently denied, we cannot request
  ///permissions.]
  const PermissionFailure(
      {String errMsg =
          // ignore: lines_longer_than_80_chars
          'Location permissions are permanently denied, we cannot request permissions.'})
      : super(message: errMsg);
}
