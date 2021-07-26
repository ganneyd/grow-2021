import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/data/models/school/school_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/presentation/child/widgets/form_group/sign_up_form_group.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/form_status.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../domain/usecases/child/register_new_child_user.dart'
    as register_new_child_user_usecase;
import '../../../../../domain/usecases/child/sign_up_new_child_user.dart'
    as sign_up_new_child_user_usecase;
import 'child_sign_up_state.dart';

///
class ChildSignUpCubit extends Cubit<ChildSignUpState> {
  ///
  ///todo remove auth and child repo?
  ChildSignUpCubit(
      {required ChildRepository childRepository,
      required AuthenticationRepository authenticationRepository})
      : _registerNewChildUser =
            register_new_child_user_usecase.RegisterNewChildUser(
                authenticationRepository: authenticationRepository,
                childRepository: childRepository),
        _signUpNewChildUser = sign_up_new_child_user_usecase.SignUpNewChildUser(
            authenticationRepository),
        super(ChildSignUpState(
            formGroups: [
              ChildSignUpForm.buildChildSignUpPage1(),
              ChildSignUpForm.buildChildSignUpPage2(
                  min: 1, max: 12, minAge: 6, maxAge: 18),
              ChildSignUpForm.buildChildSignUpPage3()
            ],
            formJSON: {},
            fetchingData: true,
            schoolsList: <SchoolModel>[],
            childModel: Child.initialChild(),
            status: FormStatus.pure,
            signUpMehtod: SignUpMethod.unkown));

  final register_new_child_user_usecase.RegisterNewChildUser
      _registerNewChildUser;
  final sign_up_new_child_user_usecase.SignUpNewChildUser _signUpNewChildUser;

  ///
  Future<void> signUpChildUser() async {
    emit(state.copyWith(
        status: FormStatus.submissionInProgress, formJSON: _getFormJson()));
    final int age = state.formJSON['age'] as int;
    state.formJSON['dateOfBirth'] =
        DateTime.now().subtract(Duration(days: 365 * age)).toString();

    final Either<Failure, String> result = await _signUpNewChildUser.call(
        sign_up_new_child_user_usecase.Params(
            childJSON: state.formJSON,
            childPassword: state.formJSON['child_password'].toString(),
            childEmail: state.formJSON['child_email'].toString(),
            parentEmail: state.formJSON['parent_email'].toString(),
            parentPassword: state.formJSON['parent_password'].toString()));

    emit(result.fold((Failure l) {
      print('failed with ${l.message}');
      return state.copyWith(
          error: l.message, status: FormStatus.submissionFailure);
    }, (String uid) {
      print('passed with $uid');
      return state.copyWith(
          childModel: state.childModel.copyWith(uid: uid),
          error: null,
          status: FormStatus.submissionSuccess);
    }));
  }

  // Future<void> registerChildUser(
  //     String childEmail, String parentEmail, String parentPassword) async {
  //   emit(state.copyWith(status: FormStatus.submissionInProgress));

  //   final Either<Failure, UserEntity> result = await _registerNewChildUser.call(
  //       register_new_child_user_usecase.Params(
  //           child: state.childModel, email: childEmail));

  //   emit(result.fold(
  //       (Failure l) => state.copyWith(
  //           error: l.message, status: FormStatus.submissionFailure),
  //       (UserEntity r) => state.copyWith(
  //           childModel: state.childModel.copyWith(uid: r.userID),
  //           error: '',
  //           status: FormStatus.submissionSuccess)));
  // }
  Map<String, dynamic> _getFormJson() {
    final Map<String, dynamic> json = {};
    for (final FormGroup element in state.formGroups) {
      json.addAll(element.value);
    }
    return json;
  }
}
