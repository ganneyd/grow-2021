import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:grow_run_v1/core/error/failures.dart';
import 'package:grow_run_v1/core/usecases/usecases.dart';
import 'package:grow_run_v1/features/grow/data/models/child/child_model.dart';
import 'package:grow_run_v1/features/grow/domain/entities/child/child_entity.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/child_repository.dart';
import 'package:grow_run_v1/features/grow/domain/usecases/child/get_current_child_user.dart';
import 'package:grow_run_v1/features/grow/presentation/child/pages/home/cubit/home_state.dart';

///The home page cubit
class HomePageCubit extends Cubit<HomePageState> {
  ///
  HomePageCubit({
    required ChildRepository childRepository,
    required AuthenticationRepository authenticationRepository,
  })   : _getCurrentChildUser = GetCurrentChildUser(
            childRepository: childRepository,
            authenticationRepository: authenticationRepository),
        super(HomePageState(child: Child.initialChild()));

  final GetCurrentChildUser _getCurrentChildUser;

  ///Retrive the child model for the current authenticated child
  Future<void> getChildModel() async {
    emit(state.copyWith(status: HomeStateStatus.loading));
    final Either<Failure, ChildEntity> result =
        await _getCurrentChildUser.call(NoParams());

    emit(result.fold(
        (Failure failure) => state.copyWith(
            error: failure.message,
            status: HomeStateStatus.loadedUnsuccessfully),
        (ChildEntity child) =>
            state.copyWith(error: null, child: Child.toChild(child))));
  }
}
