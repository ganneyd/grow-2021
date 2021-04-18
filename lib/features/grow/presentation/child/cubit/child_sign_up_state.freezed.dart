// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'child_sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChildSignUpStateTearOff {
  const _$ChildSignUpStateTearOff();

  _ChildSignUpState call(
      {required Child childModel, String? error, required FormStatus status}) {
    return _ChildSignUpState(
      childModel: childModel,
      error: error,
      status: status,
    );
  }
}

/// @nodoc
const $ChildSignUpState = _$ChildSignUpStateTearOff();

/// @nodoc
mixin _$ChildSignUpState {
  Child get childModel => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  FormStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChildSignUpStateCopyWith<ChildSignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChildSignUpStateCopyWith<$Res> {
  factory $ChildSignUpStateCopyWith(
          ChildSignUpState value, $Res Function(ChildSignUpState) then) =
      _$ChildSignUpStateCopyWithImpl<$Res>;
  $Res call({Child childModel, String? error, FormStatus status});

  $ChildCopyWith<$Res> get childModel;
}

/// @nodoc
class _$ChildSignUpStateCopyWithImpl<$Res>
    implements $ChildSignUpStateCopyWith<$Res> {
  _$ChildSignUpStateCopyWithImpl(this._value, this._then);

  final ChildSignUpState _value;
  // ignore: unused_field
  final $Res Function(ChildSignUpState) _then;

  @override
  $Res call({
    Object? childModel = freezed,
    Object? error = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      childModel: childModel == freezed
          ? _value.childModel
          : childModel // ignore: cast_nullable_to_non_nullable
              as Child,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
    ));
  }

  @override
  $ChildCopyWith<$Res> get childModel {
    return $ChildCopyWith<$Res>(_value.childModel, (value) {
      return _then(_value.copyWith(childModel: value));
    });
  }
}

/// @nodoc
abstract class _$ChildSignUpStateCopyWith<$Res>
    implements $ChildSignUpStateCopyWith<$Res> {
  factory _$ChildSignUpStateCopyWith(
          _ChildSignUpState value, $Res Function(_ChildSignUpState) then) =
      __$ChildSignUpStateCopyWithImpl<$Res>;
  @override
  $Res call({Child childModel, String? error, FormStatus status});

  @override
  $ChildCopyWith<$Res> get childModel;
}

/// @nodoc
class __$ChildSignUpStateCopyWithImpl<$Res>
    extends _$ChildSignUpStateCopyWithImpl<$Res>
    implements _$ChildSignUpStateCopyWith<$Res> {
  __$ChildSignUpStateCopyWithImpl(
      _ChildSignUpState _value, $Res Function(_ChildSignUpState) _then)
      : super(_value, (v) => _then(v as _ChildSignUpState));

  @override
  _ChildSignUpState get _value => super._value as _ChildSignUpState;

  @override
  $Res call({
    Object? childModel = freezed,
    Object? error = freezed,
    Object? status = freezed,
  }) {
    return _then(_ChildSignUpState(
      childModel: childModel == freezed
          ? _value.childModel
          : childModel // ignore: cast_nullable_to_non_nullable
              as Child,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
    ));
  }
}

/// @nodoc
class _$_ChildSignUpState implements _ChildSignUpState {
  _$_ChildSignUpState(
      {required this.childModel, this.error, required this.status});

  @override
  final Child childModel;
  @override
  final String? error;
  @override
  final FormStatus status;

  @override
  String toString() {
    return 'ChildSignUpState(childModel: $childModel, error: $error, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChildSignUpState &&
            (identical(other.childModel, childModel) ||
                const DeepCollectionEquality()
                    .equals(other.childModel, childModel)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(childModel) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(status);

  @JsonKey(ignore: true)
  @override
  _$ChildSignUpStateCopyWith<_ChildSignUpState> get copyWith =>
      __$ChildSignUpStateCopyWithImpl<_ChildSignUpState>(this, _$identity);
}

abstract class _ChildSignUpState implements ChildSignUpState {
  factory _ChildSignUpState(
      {required Child childModel,
      String? error,
      required FormStatus status}) = _$_ChildSignUpState;

  @override
  Child get childModel => throw _privateConstructorUsedError;
  @override
  String? get error => throw _privateConstructorUsedError;
  @override
  FormStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChildSignUpStateCopyWith<_ChildSignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}
