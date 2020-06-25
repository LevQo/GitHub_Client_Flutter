// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'public_github_repositories_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PublicGithubRepositoriesEventTearOff {
  const _$PublicGithubRepositoriesEventTearOff();

  _GetRepositories getRepositories() {
    return const _GetRepositories();
  }
}

// ignore: unused_element
const $PublicGithubRepositoriesEvent = _$PublicGithubRepositoriesEventTearOff();

mixin _$PublicGithubRepositoriesEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getRepositories(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getRepositories(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getRepositories(_GetRepositories value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getRepositories(_GetRepositories value),
    @required Result orElse(),
  });
}

abstract class $PublicGithubRepositoriesEventCopyWith<$Res> {
  factory $PublicGithubRepositoriesEventCopyWith(
          PublicGithubRepositoriesEvent value,
          $Res Function(PublicGithubRepositoriesEvent) then) =
      _$PublicGithubRepositoriesEventCopyWithImpl<$Res>;
}

class _$PublicGithubRepositoriesEventCopyWithImpl<$Res>
    implements $PublicGithubRepositoriesEventCopyWith<$Res> {
  _$PublicGithubRepositoriesEventCopyWithImpl(this._value, this._then);

  final PublicGithubRepositoriesEvent _value;
  // ignore: unused_field
  final $Res Function(PublicGithubRepositoriesEvent) _then;
}

abstract class _$GetRepositoriesCopyWith<$Res> {
  factory _$GetRepositoriesCopyWith(
          _GetRepositories value, $Res Function(_GetRepositories) then) =
      __$GetRepositoriesCopyWithImpl<$Res>;
}

class __$GetRepositoriesCopyWithImpl<$Res>
    extends _$PublicGithubRepositoriesEventCopyWithImpl<$Res>
    implements _$GetRepositoriesCopyWith<$Res> {
  __$GetRepositoriesCopyWithImpl(
      _GetRepositories _value, $Res Function(_GetRepositories) _then)
      : super(_value, (v) => _then(v as _GetRepositories));

  @override
  _GetRepositories get _value => super._value as _GetRepositories;
}

class _$_GetRepositories implements _GetRepositories {
  const _$_GetRepositories();

  @override
  String toString() {
    return 'PublicGithubRepositoriesEvent.getRepositories()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GetRepositories);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result getRepositories(),
  }) {
    assert(getRepositories != null);
    return getRepositories();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result getRepositories(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getRepositories != null) {
      return getRepositories();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result getRepositories(_GetRepositories value),
  }) {
    assert(getRepositories != null);
    return getRepositories(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result getRepositories(_GetRepositories value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getRepositories != null) {
      return getRepositories(this);
    }
    return orElse();
  }
}

abstract class _GetRepositories implements PublicGithubRepositoriesEvent {
  const factory _GetRepositories() = _$_GetRepositories;
}
