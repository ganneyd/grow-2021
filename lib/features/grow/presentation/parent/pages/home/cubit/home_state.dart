import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grow_run_v1/features/grow/data/models/parent/parent_model.dart';
part 'home_state.freezed.dart';

///The different states the home page can be in
enum HomeStateStatus {
  ///The home page is loading
  loading,

  ///The Home page loaded without errors
  loadedSuccessfully,

  ///The home page loaded with errors
  loadedUnsuccessfully
}

///Parent HomePage State
@freezed
class HomePageState with _$HomePageState {
  ///;
  factory HomePageState({
    required ParentModel parent,
    String? error,
    @Default(HomeStateStatus.loading) HomeStateStatus status,
  }) = _HomePageState;
}
