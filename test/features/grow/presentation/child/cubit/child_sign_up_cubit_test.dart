import 'package:grow_run_v1/core/util/gender.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/presentation/child/cubit/child_sign_up_cubit.dart';
import 'package:grow_run_v1/features/grow/presentation/child/cubit/child_sign_up_state.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/form_status.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import '../../../domain/usecases/child/sign_up_new_child_user_test.mocks.dart';

class MockChildSignUpCubit extends MockCubit<ChildSignUpState>
    implements ChildSignUpCubit {}

void main() {
  final MockChildRepository mockChildRepository = MockChildRepository();
  final MockAuthenticationRepository mockAuthenticationRepository =
      MockAuthenticationRepository();

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

  group('nj', () {
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
}
