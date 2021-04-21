import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/user/user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/presentation/widgets/form_status.dart';

import '../../../domain/usecases/child/register_new_child_user.dart'
    as register_new_child_user_usecase;
import '../../../domain/usecases/child/sign_up_new_child_user.dart'
    as sign_up_new_child_user_usecase;
import 'child_sign_up_state.dart';

///
class ChildSignUpCubit extends Cubit<ChildSignUpState> {
  ///
  ChildSignUpCubit(
      {required ChildRepository childRepository,
      required AuthenticationRepository authenticationRepository})
      : _registerNewChildUser =
            register_new_child_user_usecase.RegisterNewChildUser(
                authenticationRepository: authenticationRepository,
                childRepository: childRepository),
        _signUpNewChildUser = sign_up_new_child_user_usecase.SignUpNewChildUser(
            authenticationRepository: authenticationRepository,
            childRepository: childRepository),
        super(ChildSignUpState(
            childModel: Child.initialChild(), status: FormStatus.pure));

  final register_new_child_user_usecase.RegisterNewChildUser
      _registerNewChildUser;
  final sign_up_new_child_user_usecase.SignUpNewChildUser _signUpNewChildUser;

  ///When the form is valid and the user submits the form, the JSON data is
  ///passed to this method and then appended to the childModel
  void formSubmitted(Map<String, dynamic> formJson) {
    final Child parseJson = Child.copyFromJson(formJson, state.childModel);
    emit(state.copyWith(childModel: parseJson));
  }

  ///
  Future<void> signUpChildUser(String childEmail, String childPassword,
      String parentEmail, String parentPassword) async {
    emit(state.copyWith(status: FormStatus.submissionInProgress));

    final Either<Failure, UserEntity> result = await _signUpNewChildUser.call(
        sign_up_new_child_user_usecase.Params(
            child: state.childModel,
            password: childPassword,
            email: childEmail));

    emit(result.fold(
        (Failure l) => state.copyWith(
            error: l.message, status: FormStatus.submissionFailure),
        (UserEntity r) => state.copyWith(
            childModel: state.childModel.copyWith(uid: r.userID),
            error: '',
            status: FormStatus.submissionSuccess)));
  }

  Future<void> registerChildUser(
      String childEmail, String parentEmail, String parentPassword) async {
    emit(state.copyWith(status: FormStatus.submissionInProgress));

    final Either<Failure, UserEntity> result = await _registerNewChildUser.call(
        register_new_child_user_usecase.Params(
            child: state.childModel, email: childEmail));

    emit(result.fold(
        (Failure l) => state.copyWith(
            error: l.message, status: FormStatus.submissionFailure),
        (UserEntity r) => state.copyWith(
            childModel: state.childModel.copyWith(uid: r.userID),
            error: '',
            status: FormStatus.submissionSuccess)));
  }
}
