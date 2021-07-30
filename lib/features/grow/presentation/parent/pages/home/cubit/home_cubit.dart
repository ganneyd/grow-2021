import 'package:bloc/bloc.dart';
import 'package:grow_run_v1/features/grow/data/models/parent/parent_model.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/authentication_repository.dart';
import 'package:grow_run_v1/features/grow/domain/repositories/parent_repository.dart';
import 'package:grow_run_v1/features/grow/presentation/parent/pages/home/cubit/home_state.dart';

///The home page cubit for the parent
class HomePageCubit extends Cubit<HomePageState> {
  ///Provide a [parent repository] instance and a [authentication repo] instance
  HomePageCubit({
    required ParentRepository parentRepository,
    required AuthenticationRepository authenticationRepository,
  }) : super(HomePageState(
            parent: ParentModel(), status: HomeStateStatus.loading));
}
