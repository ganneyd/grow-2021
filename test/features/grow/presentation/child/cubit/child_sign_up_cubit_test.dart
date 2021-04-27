import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/util/gender.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/sign_up/cubit/child_sign_up_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/sign_up/cubit/child_sign_up_state.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/form_status.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import '../../../domain/usecases/child/sign_up_new_child_user_test.mocks.dart';

class MockChildSignUpCubit extends MockCubit<ChildSignUpState>
    implements ChildSignUpCubit {}

void main() {
  final MockChildRepository mockChildRepository = MockChildRepository();
  final MockAuthenticationRepository mockAuthenticationRepository =
      MockAuthenticationRepository();
  const String childEmail = 'ganneyd@gmail.com';
  const String childPassword = '123456';
  const String parentEmail = 'parent@email.com';
  const String parentPassword = 'parent-password';
  const UserEntity expectedUserEntity = UserEntity(
      userEmail: childEmail,
      userID: 'cubit-test',
      name: 'cubi†-test',
      userType: UserType.child);
  final Map<String, dynamic> formPage1JSON = {
    'username': 'GanneyD501',
    'email': 'ganneyd@gmail.com',
    'firstname': 'Ganney',
    'lastname': 'Dortch',
    'gender': 'male'
  };

  final Map<String, dynamic> formPage2JSON = {
    'dateOfBirth': DateTime.utc(1999, 8, 8).toString(),
    'schoolID': 'martin-1',
    'gradeLevel': 1,
  };
  setUpAll(() {});

  group('Tests for the formSubmitted() method', () {
    blocTest<ChildSignUpCubit, ChildSignUpState>(
        'emits state with all values from form page 1',
        build: () => ChildSignUpCubit(
            childRepository: mockChildRepository,
            authenticationRepository: mockAuthenticationRepository),
        act: (ChildSignUpCubit cubit) => cubit.formSubmitted(formPage1JSON),
        expect: () => [
              ChildSignUpState(
                  childModel: Child(
                      uid: 'no-id',
                      username: 'GanneyD501',
                      firstname: 'Ganney',
                      lastname: 'Dortch',
                      gender: Gender.male,
                      dateOfBirth: null,
                      gradeLevel: 0,
                      parentID: 'no-parentID',
                      schoolID: 'no-schoolID'),
                  error: null,
                  status: FormStatus.pure)
            ]);

    blocTest<ChildSignUpCubit, ChildSignUpState>(
        'emits state with all values from form page 1',
        build: () => ChildSignUpCubit(
            childRepository: mockChildRepository,
            authenticationRepository: mockAuthenticationRepository),
        act: (ChildSignUpCubit cubit) {
          cubit.formSubmitted(formPage1JSON);
          cubit.formSubmitted(formPage2JSON);
        },
        expect: () => [
              ChildSignUpState(
                  childModel: Child(
                      uid: 'no-id',
                      username: 'GanneyD501',
                      firstname: 'Ganney',
                      lastname: 'Dortch',
                      gender: Gender.male,
                      dateOfBirth: null,
                      gradeLevel: 0,
                      parentID: 'no-parentID',
                      schoolID: 'no-schoolID'),
                  error: null,
                  status: FormStatus.pure),
              ChildSignUpState(
                  childModel: Child(
                      uid: 'no-id',
                      username: 'GanneyD501',
                      firstname: 'Ganney',
                      lastname: 'Dortch',
                      gender: Gender.male,
                      dateOfBirth: DateTime.utc(1999, 8, 8),
                      gradeLevel: 1,
                      parentID: 'no-parentID',
                      schoolID: 'martin-1'),
                  error: null,
                  status: FormStatus.pure)
            ]);
  });

  group('Tests for the ', () {
    blocTest<ChildSignUpCubit, ChildSignUpState>(
        'emits state with all values from form page 1',
        build: () => ChildSignUpCubit(
            childRepository: mockChildRepository,
            authenticationRepository: mockAuthenticationRepository),
        act: (ChildSignUpCubit cubit) {
          when(mockAuthenticationRepository.authenticateUser(any, any))
              .thenAnswer((_) async =>
                  const Right<Failure, UserEntity>(expectedUserEntity));
          when(mockAuthenticationRepository.signUpUser(any, any)).thenAnswer(
              (_) async =>
                  const Right<Failure, UserEntity>(expectedUserEntity));
          when(mockChildRepository.createChildData(any))
              .thenAnswer((_) async => Right<Failure, void>(_));
          cubit.signUpChildUser(
              childEmail, childPassword, parentEmail, parentPassword);
        },
        expect: () => [
              ChildSignUpState(
                  childModel: Child.initialChild(),
                  status: FormStatus.submissionInProgress),
              ChildSignUpState(
                  childModel: Child(
                    uid: 'cubit-test',
                  ),
                  status: FormStatus.submissionSuccess)
            ]);
  });
}
