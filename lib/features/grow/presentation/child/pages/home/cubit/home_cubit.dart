import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/core/util/build_info.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/data/models/child_user_model.dart';
import 'package:grow_run_v1/features/grow/data/models/models_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/entities/child_user_entity.dart';
import 'package:grow_run_v1/features/grow/domain/entities/entities_bucket.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/grow_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/school_repository.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/child/get_current_child_user.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/get_build_info.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/home/cubit/home_state.dart';

///The home page cubit
class HomePageCubit extends Cubit<HomePageState> {
  ///
  HomePageCubit({
    required ChildRepository childRepository,
    required AuthenticationRepository authenticationRepository,
    required GROWRepository growRepository,
    required SchoolRepository schoolRepository,
  })  : _getCurrentChildUser = GetCurrentChildUser(
            schoolRepository: schoolRepository,
            childRepository: childRepository,
            authenticationRepository: authenticationRepository),
        _getBuildInfo = GetBuildInfo(growRepository: growRepository),
        super(HomePageState(
          child: ChildUserModel(
              uid: 'no-id',
              email: 'no-email',
              child: Child(),
              parentModel: ParentModel(),
              schoolModel: SchoolModel()),
        ));

  final GetCurrentChildUser _getCurrentChildUser;
  final GetBuildInfo _getBuildInfo;

  ///Retrieve the child model for the current authenticated child and build info
  Future<void> init() async {
    //currently getting data so let state reflect that
    emit(state.copyWith(status: HomeStateStatus.loading));

    ///get the child user info
    final Either<Failure, ChildUserEntity> result =
        await _getCurrentChildUser.call(NoParams());

    //get info about the  app
    final Either<Failure, BuildInfo> buildResults =
        await _getBuildInfo.call(NoParams());
    emit(buildResults.fold((_) => state, (BuildInfo buildInfo) {
      print(buildInfo.appName);
      return state.copyWith(buildInfo: buildInfo);
    }));

    emit(result.fold(
        (Failure failure) => state.copyWith(
            error: failure.message,
            status: HomeStateStatus.loadedUnsuccessfully),
        (ChildUserEntity child) => state.copyWith(
            error: null,
            child: ChildUserModel(
              email: child.email,
              uid: child.uid,
              child: Child.toChild(child.childEntity),
              parentModel: ParentModel(),
              schoolModel: SchoolModel.toSchoolModel(child.schoolEntity),
            ),
            status: HomeStateStatus.loadedSuccessfully)));
  }
}
