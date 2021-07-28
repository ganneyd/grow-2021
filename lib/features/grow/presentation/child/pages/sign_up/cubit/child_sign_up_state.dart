import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/data/models/models_bucket.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/form_status.dart';
import 'package:reactive_forms/reactive_forms.dart';
part 'child_sign_up_state.freezed.dart';

///If the child's acc is either being  [registering] or [creating] by a user
enum SignUpMethod {
  ///Don't know atm how the child acc will be created
  unkown,

  ///Child acc is being created by another user ex. Admin, Parent
  registering,

  ///Child acc is being created by them directly
  creatingAcc
}

///The current status of the Child Sign Up Cubit
enum Status {
  ///the initial state of the cubit
  initial,

  ///fetching data that's relevant to the form
  fetchingData,

  ///fetch said data without errors
  fetchingDataSuccessfully,

  ///fetched said data with errors
  fetchingDataUnsuccessfully,

  ///form is being submitted
  submittingForm,

  ///form was submitted without errors
  submittedFormSuccessfully,

  ///form was submitted with errors
  submittedFormUnsuccessfully,
}

///provide methods to determine what the status is in a cleaner manner
extension StatusExtension on Status {
  ///returns whether or not the status is [initial]
  bool isInitial() => this == Status.initial;

  ///returns whether or not the status is [fetchingData]
  bool isFetchingData() => this == Status.fetchingData;

  ///returns whether or not the status is [fetchingDataSuccessfully]
  bool isFetchingDataSuccessfully() => this == Status.fetchingDataSuccessfully;

  ///returns whether or not the status is [fetchingDataUnsuccessfully]
  bool isFetchingDataUnsuccessfully() =>
      this == Status.fetchingDataUnsuccessfully;

  ///returns whether or not the status is [submittingForm]
  bool isSubmittingForm() => this == Status.submittingForm;

  ///returns whether or not the status is [SubmittedFormSuccessfully]
  bool isSubmittedFormSuccessfully() =>
      this == Status.submittedFormSuccessfully;

  ///returns whether or not the status is [SubmittedFormUnsuccessfully]
  bool isSubmittedFormUnsuccessfully() =>
      this == Status.submittedFormUnsuccessfully;
}

///
@freezed
class ChildSignUpState with _$ChildSignUpState {
  ///
  factory ChildSignUpState(
          {required Child childModel,
          required List<FormGroup> formGroups,
          required Map<String, dynamic> formJSON,
          String? error,
          required Status status,
          required List<SchoolModel> schoolsList,
          @Default(SignUpMethod.unkown) SignUpMethod signUpMehtod}) =
      _ChildSignUpState;
}
