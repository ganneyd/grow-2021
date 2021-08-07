import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_state.freezed.dart';

///The different state the route page can be in
enum RoutePageStatus {
  ///The routes are being retrieved
  loading,

  /// The data were retrieved successfully
  loadedSuccessfully,

  /// The data were retrieved with some errors
  loadedUnsuccessfully,
}

///
@freezed
class RoutePageState with _$RoutePageState {
  ///
  factory RoutePageState({
    @Default(RoutePageStatus.loading) RoutePageStatus status,
  }) = _RoutePageState;
}
