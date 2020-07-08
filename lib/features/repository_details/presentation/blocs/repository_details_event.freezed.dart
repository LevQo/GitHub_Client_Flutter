// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'repository_details_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RepositoryDetailsEventTearOff {
  const _$RepositoryDetailsEventTearOff();

  _GetDetails getDetails({@required String owner, @required String repo}) {
    return _GetDetails(
      owner: owner,
      repo: repo,
    );
  }
}

// ignore: unused_element
const $RepositoryDetailsEvent = _$RepositoryDetailsEventTearOff();

mixin _$RepositoryDetailsEvent {
  String get owner;
  String get repo;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getDetails(String owner, String repo),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getDetails(String owner, String repo),
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

  $RepositoryDetailsEventCopyWith<RepositoryDetailsEvent> get copyWith;
}

abstract class $RepositoryDetailsEventCopyWith<$Res> {
  factory $RepositoryDetailsEventCopyWith(RepositoryDetailsEvent value,
          $Res Function(RepositoryDetailsEvent) then) =
      _$RepositoryDetailsEventCopyWithImpl<$Res>;
  $Res call({String owner, String repo});
}

class _$RepositoryDetailsEventCopyWithImpl<$Res>
    implements $RepositoryDetailsEventCopyWith<$Res> {
  _$RepositoryDetailsEventCopyWithImpl(this._value, this._then);

  final RepositoryDetailsEvent _value;
  // ignore: unused_field
  final $Res Function(RepositoryDetailsEvent) _then;

  @override
  $Res call({
    Object owner = freezed,
    Object repo = freezed,
  }) {
    return _then(_value.copyWith(
      owner: owner == freezed ? _value.owner : owner as String,
      repo: repo == freezed ? _value.repo : repo as String,
    ));
  }
}

abstract class _$GetDetailsCopyWith<$Res>
    implements $RepositoryDetailsEventCopyWith<$Res> {
  factory _$GetDetailsCopyWith(
          _GetDetails value, $Res Function(_GetDetails) then) =
      __$GetDetailsCopyWithImpl<$Res>;
  @override
  $Res call({String owner, String repo});
}

class __$GetDetailsCopyWithImpl<$Res>
    extends _$RepositoryDetailsEventCopyWithImpl<$Res>
    implements _$GetDetailsCopyWith<$Res> {
  __$GetDetailsCopyWithImpl(
      _GetDetails _value, $Res Function(_GetDetails) _then)
      : super(_value, (v) => _then(v as _GetDetails));

  @override
  _GetDetails get _value => super._value as _GetDetails;

  @override
  $Res call({
    Object owner = freezed,
    Object repo = freezed,
  }) {
    return _then(_GetDetails(
      owner: owner == freezed ? _value.owner : owner as String,
      repo: repo == freezed ? _value.repo : repo as String,
    ));
  }
}

class _$_GetDetails implements _GetDetails {
  const _$_GetDetails({@required this.owner, @required this.repo})
      : assert(owner != null),
        assert(repo != null);

  @override
  final String owner;
  @override
  final String repo;

  @override
  String toString() {
    return 'RepositoryDetailsEvent.getDetails(owner: $owner, repo: $repo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetDetails &&
            (identical(other.owner, owner) ||
                const DeepCollectionEquality().equals(other.owner, owner)) &&
            (identical(other.repo, repo) ||
                const DeepCollectionEquality().equals(other.repo, repo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(owner) ^
      const DeepCollectionEquality().hash(repo);

  @override
  _$GetDetailsCopyWith<_GetDetails> get copyWith =>
      __$GetDetailsCopyWithImpl<_GetDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getDetails(String owner, String repo),
  }) {
    assert(getDetails != null);
    return getDetails(owner, repo);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getDetails(String owner, String repo),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getDetails != null) {
      return getDetails(owner, repo);
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

abstract class _GetDetails implements RepositoryDetailsEvent {
  const factory _GetDetails({@required String owner, @required String repo}) =
      _$_GetDetails;

  @override
  String get owner;
  @override
  String get repo;
  @override
  _$GetDetailsCopyWith<_GetDetails> get copyWith;
}
