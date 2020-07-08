// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user_details_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$UserDetailsEventTearOff {
  const _$UserDetailsEventTearOff();

  _GetDetails getDetails({@required String username}) {
    return _GetDetails(
      username: username,
    );
  }
}

// ignore: unused_element
const $UserDetailsEvent = _$UserDetailsEventTearOff();

mixin _$UserDetailsEvent {
  String get username;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getDetails(String username),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getDetails(String username),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getDetails(_GetDetails value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getDetails(_GetDetails value),
    @required Result orElse(),
  });

  $UserDetailsEventCopyWith<UserDetailsEvent> get copyWith;
}

abstract class $UserDetailsEventCopyWith<$Res> {
  factory $UserDetailsEventCopyWith(
          UserDetailsEvent value, $Res Function(UserDetailsEvent) then) =
      _$UserDetailsEventCopyWithImpl<$Res>;
  $Res call({String username});
}

class _$UserDetailsEventCopyWithImpl<$Res>
    implements $UserDetailsEventCopyWith<$Res> {
  _$UserDetailsEventCopyWithImpl(this._value, this._then);

  final UserDetailsEvent _value;
  // ignore: unused_field
  final $Res Function(UserDetailsEvent) _then;

  @override
  $Res call({
    Object username = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed ? _value.username : username as String,
    ));
  }
}

abstract class _$GetDetailsCopyWith<$Res>
    implements $UserDetailsEventCopyWith<$Res> {
  factory _$GetDetailsCopyWith(
          _GetDetails value, $Res Function(_GetDetails) then) =
      __$GetDetailsCopyWithImpl<$Res>;
  @override
  $Res call({String username});
}

class __$GetDetailsCopyWithImpl<$Res>
    extends _$UserDetailsEventCopyWithImpl<$Res>
    implements _$GetDetailsCopyWith<$Res> {
  __$GetDetailsCopyWithImpl(
      _GetDetails _value, $Res Function(_GetDetails) _then)
      : super(_value, (v) => _then(v as _GetDetails));

  @override
  _GetDetails get _value => super._value as _GetDetails;

  @override
  $Res call({
    Object username = freezed,
  }) {
    return _then(_GetDetails(
      username: username == freezed ? _value.username : username as String,
    ));
  }
}

class _$_GetDetails implements _GetDetails {
  const _$_GetDetails({@required this.username}) : assert(username != null);

  @override
  final String username;

  @override
  String toString() {
    return 'UserDetailsEvent.getDetails(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetDetails &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(username);

  @override
  _$GetDetailsCopyWith<_GetDetails> get copyWith =>
      __$GetDetailsCopyWithImpl<_GetDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getDetails(String username),
  }) {
    assert(getDetails != null);
    return getDetails(username);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getDetails(String username),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getDetails != null) {
      return getDetails(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getDetails(_GetDetails value),
  }) {
    assert(getDetails != null);
    return getDetails(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getDetails(_GetDetails value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getDetails != null) {
      return getDetails(this);
    }
    return orElse();
  }
}

abstract class _GetDetails implements UserDetailsEvent {
  const factory _GetDetails({@required String username}) = _$_GetDetails;

  @override
  String get username;
  @override
  _$GetDetailsCopyWith<_GetDetails> get copyWith;
}
