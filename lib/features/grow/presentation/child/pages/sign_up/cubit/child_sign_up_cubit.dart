import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/data/models/school/school_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/school/school_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';

import 'package:grow_run_v1/features/grow/domain/repositories/school_repository.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/school/get_list_of_schools.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/sign_up/widgets/form_group/sign_up_form_group.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../domain/usecases/child/sign_up_new_child_user.dart'
    as sign_up_new_child_user_usecase;
import 'child_sign_up_state.dart';

///
class ChildSignUpCubit extends Cubit<ChildSignUpState> {
  ///
  ///TODO remove auth and child repo?
  ChildSignUpCubit(
      { //required ChildRepository childRepository,
      required AuthenticationRepository authenticationRepository,
      required SchoolRepository schoolRepository})
      :
        //initialize the register child usecase
        // _registerNewChildUser =
        //     register_new_child_user_usecase.RegisterNewChildUser(
        //         authenticationRepository: authenticationRepository,
        //         childRepository: childRepository),
        //initialize the sign up child usecase
        _signUpNewChildUser = sign_up_new_child_user_usecase.SignUpNewChildUser(
            authenticationRepository),
        //initialize the getSchools usecase
        _getSchools = GetListOfSchools(schoolRepository),
        //initialize the state and set default values
        super(ChildSignUpState(
            formGroups: <FormGroup>[
              ChildSignUpForm.buildChildSignUpPage1(),
              ChildSignUpForm.buildChildSignUpPage2(
                  min: 1, max: 12, minAge: 6, maxAge: 18),
              ChildSignUpForm.buildChildSignUpPage3()
            ],
            formJSON: <String, dynamic>{},
            status: Status.initial,
            schoolsList: <SchoolModel>[],
            childModel: Child.initialChild(),
            signUpMehtod: SignUpMethod.unkown));

  //usecase that registers child
  // final register_new_child_user_usecase.RegisterNewChildUser
  //     _registerNewChildUser;
  //usecase that signs up child
  final sign_up_new_child_user_usecase.SignUpNewChildUser _signUpNewChildUser;
  //usecase that fetches the list of schools from the db
  final GetListOfSchools _getSchools;

  ///gets the necessary  data to populate the form with
  Future<void> getData() async {
    emit(state.copyWith(status: Status.fetchingData));

    final Either<Failure, List<SchoolEntity>> result =
        await _getSchools.call(NoParams());

    emit(result.fold((Failure failure) {
      print('failure getting data');
      print(failure.message);
      return state.copyWith(
          status: Status.fetchingDataUnsuccessfully, error: failure.message);
    }, (List<SchoolEntity> schools) {
      print(schools);
      print('got dara');
      final List<SchoolModel> schoolModels = <SchoolModel>[];
      for (final SchoolEntity school in schools) {
        print(school);
        schoolModels.add(SchoolModel.toSchoolModel(school));
      }
      return state.copyWith(
          schoolsList: schoolModels, status: Status.fetchingDataSuccessfully);
    }));
  }

  ///signs up the child user
  Future<void> signUpChildUser() async {
    //send out that the form is being submitted
    emit(state.copyWith(
        status: Status.submittingForm, formJSON: _getFormJson()));
    //attempt to extract schoolmodel
    final SchoolModel schoolModel = state.formJSON['school'] as SchoolModel;
    //perform operation on age to convert it to date formatt
    final int age = state.formJSON['age'] as int;

    state.formJSON['dateOfBirth'] =
        DateTime.now().subtract(Duration(days: 365 * age)).toString();
    state.formJSON['schoolID'] = schoolModel.uid;
//make the usecase call and sign up the child  user
    final Either<Failure, String> result = await _signUpNewChildUser.call(
        sign_up_new_child_user_usecase.Params(
            childJSON: state.formJSON,
            childPassword: state.formJSON['child_password'].toString(),
            childEmail: state.formJSON['child_email'].toString(),
            parentEmail: state.formJSON['parent_email'].toString(),
            parentPassword: state.formJSON['parent_password'].toString()));
//if it failes then emit the failure
    emit(result.fold((Failure l) {
      print('failed with ${l.message}');
      return state.copyWith(
          error: l.message, status: Status.submittedFormUnsuccessfully);
    },
        //else if it did not fail emit success
        (String uid) {
      print('passed with $uid');
      return state.copyWith(
          error: null, status: Status.submittedFormSuccessfully);
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
  ///method to extract the json data from the formgroups
  ///aka [Map<String,dynamic>]
  Map<String, dynamic> _getFormJson() {
    final Map<String, dynamic> json = {};
    for (final FormGroup element in state.formGroups) {
      json.addAll(element.value);
    }
    return json;
  }
}
