// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'public_github_repositories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PublicGithubRepositoriesStateTearOff {
  const _$PublicGithubRepositoriesStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _LoadingNextPage loadingNextPage(
      {@required List<GitHubRepositoryEntity> currentRepositories}) {
    return _LoadingNextPage(
      currentRepositories: currentRepositories,
    );
  }

  Loaded loaded({@required List<GitHubRepositoryEntity> repositories}) {
    return Loaded(
      repositories: repositories,
    );
  }

  _Error error({String message}) {
    return _Error(
      message: message,
    );
  }
}

// ignore: unused_element
const $PublicGithubRepositoriesState = _$PublicGithubRepositoriesStateTearOff();

mixin _$PublicGithubRepositoriesState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required
        Result loadingNextPage(
            List<GitHubRepositoryEntity> currentRepositories),
    @required Result loaded(List<GitHubRepositoryEntity> repositories),
    @required Result error(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadingNextPage(List<GitHubRepositoryEntity> currentRepositories),
    Result loaded(List<GitHubRepositoryEntity> repositories),
    Result error(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadingNextPage(_LoadingNextPage value),
    @required Result loaded(Loaded value),
    @required Result error(_Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result loadingNextPage(_LoadingNextPage value),
    Result loaded(Loaded value),
    Result error(_Error value),
    @required Result orElse(),
  });
}

abstract class $PublicGithubRepositoriesStateCopyWith<$Res> {
  factory $PublicGithubRepositoriesStateCopyWith(
          PublicGithubRepositoriesState value,
          $Res Function(PublicGithubRepositoriesState) then) =
      _$PublicGithubRepositoriesStateCopyWithImpl<$Res>;
}

class _$PublicGithubRepositoriesStateCopyWithImpl<$Res>
    implements $PublicGithubRepositoriesStateCopyWith<$Res> {
  _$PublicGithubRepositoriesStateCopyWithImpl(this._value, this._then);

  final PublicGithubRepositoriesState _value;
  // ignore: unused_field
  final $Res Function(PublicGithubRepositoriesState) _then;
}

abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

class __$InitialCopyWithImpl<$Res>
    extends _$PublicGithubRepositoriesStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublicGithubRepositoriesState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'PublicGithubRepositoriesState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required
        Result loadingNextPage(
            List<GitHubRepositoryEntity> currentRepositories),
    @required Result loaded(List<GitHubRepositoryEntity> repositories),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingNextPage != null);
    assert(loaded != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadingNextPage(List<GitHubRepositoryEntity> currentRepositories),
    Result loaded(List<GitHubRepositoryEntity> repositories),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadingNextPage(_LoadingNextPage value),
    @required Result loaded(Loaded value),
    @required Result error(_Error value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingNextPage != null);
    assert(loaded != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result loadingNextPage(_LoadingNextPage value),
    Result loaded(Loaded value),
    Result error(_Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PublicGithubRepositoriesState {
  const factory _Initial() = _$_Initial;
}

abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

class __$LoadingCopyWithImpl<$Res>
    extends _$PublicGithubRepositoriesStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

class _$_Loading with DiagnosticableTreeMixin implements _Loading {
  const _$_Loading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublicGithubRepositoriesState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'PublicGithubRepositoriesState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required
        Result loadingNextPage(
            List<GitHubRepositoryEntity> currentRepositories),
    @required Result loaded(List<GitHubRepositoryEntity> repositories),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingNextPage != null);
    assert(loaded != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadingNextPage(List<GitHubRepositoryEntity> currentRepositories),
    Result loaded(List<GitHubRepositoryEntity> repositories),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadingNextPage(_LoadingNextPage value),
    @required Result loaded(Loaded value),
    @required Result error(_Error value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingNextPage != null);
    assert(loaded != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result loadingNextPage(_LoadingNextPage value),
    Result loaded(Loaded value),
    Result error(_Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PublicGithubRepositoriesState {
  const factory _Loading() = _$_Loading;
}

abstract class _$LoadingNextPageCopyWith<$Res> {
  factory _$LoadingNextPageCopyWith(
          _LoadingNextPage value, $Res Function(_LoadingNextPage) then) =
      __$LoadingNextPageCopyWithImpl<$Res>;
  $Res call({List<GitHubRepositoryEntity> currentRepositories});
}

class __$LoadingNextPageCopyWithImpl<$Res>
    extends _$PublicGithubRepositoriesStateCopyWithImpl<$Res>
    implements _$LoadingNextPageCopyWith<$Res> {
  __$LoadingNextPageCopyWithImpl(
      _LoadingNextPage _value, $Res Function(_LoadingNextPage) _then)
      : super(_value, (v) => _then(v as _LoadingNextPage));

  @override
  _LoadingNextPage get _value => super._value as _LoadingNextPage;

  @override
  $Res call({
    Object currentRepositories = freezed,
  }) {
    return _then(_LoadingNextPage(
      currentRepositories: currentRepositories == freezed
          ? _value.currentRepositories
          : currentRepositories as List<GitHubRepositoryEntity>,
    ));
  }
}

class _$_LoadingNextPage
    with DiagnosticableTreeMixin
    implements _LoadingNextPage {
  const _$_LoadingNextPage({@required this.currentRepositories})
      : assert(currentRepositories != null);

  @override
  final List<GitHubRepositoryEntity> currentRepositories;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublicGithubRepositoriesState.loadingNextPage(currentRepositories: $currentRepositories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'PublicGithubRepositoriesState.loadingNextPage'))
      ..add(DiagnosticsProperty('currentRepositories', currentRepositories));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadingNextPage &&
            (identical(other.currentRepositories, currentRepositories) ||
                const DeepCollectionEquality()
                    .equals(other.currentRepositories, currentRepositories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentRepositories);

  @override
  _$LoadingNextPageCopyWith<_LoadingNextPage> get copyWith =>
      __$LoadingNextPageCopyWithImpl<_LoadingNextPage>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required
        Result loadingNextPage(
            List<GitHubRepositoryEntity> currentRepositories),
    @required Result loaded(List<GitHubRepositoryEntity> repositories),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingNextPage != null);
    assert(loaded != null);
    assert(error != null);
    return loadingNextPage(currentRepositories);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadingNextPage(List<GitHubRepositoryEntity> currentRepositories),
    Result loaded(List<GitHubRepositoryEntity> repositories),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingNextPage != null) {
      return loadingNextPage(currentRepositories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadingNextPage(_LoadingNextPage value),
    @required Result loaded(Loaded value),
    @required Result error(_Error value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingNextPage != null);
    assert(loaded != null);
    assert(error != null);
    return loadingNextPage(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result loadingNextPage(_LoadingNextPage value),
    Result loaded(Loaded value),
    Result error(_Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadingNextPage != null) {
      return loadingNextPage(this);
    }
    return orElse();
  }
}

abstract class _LoadingNextPage implements PublicGithubRepositoriesState {
  const factory _LoadingNextPage(
          {@required List<GitHubRepositoryEntity> currentRepositories}) =
      _$_LoadingNextPage;

  List<GitHubRepositoryEntity> get currentRepositories;
  _$LoadingNextPageCopyWith<_LoadingNextPage> get copyWith;
}

abstract class $LoadedCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) then) =
      _$LoadedCopyWithImpl<$Res>;
  $Res call({List<GitHubRepositoryEntity> repositories});
}

class _$LoadedCopyWithImpl<$Res>
    extends _$PublicGithubRepositoriesStateCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(Loaded _value, $Res Function(Loaded) _then)
      : super(_value, (v) => _then(v as Loaded));

  @override
  Loaded get _value => super._value as Loaded;

  @override
  $Res call({
    Object repositories = freezed,
  }) {
    return _then(Loaded(
      repositories: repositories == freezed
          ? _value.repositories
          : repositories as List<GitHubRepositoryEntity>,
    ));
  }
}

class _$Loaded with DiagnosticableTreeMixin implements Loaded {
  const _$Loaded({@required this.repositories}) : assert(repositories != null);

  @override
  final List<GitHubRepositoryEntity> repositories;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublicGithubRepositoriesState.loaded(repositories: $repositories)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PublicGithubRepositoriesState.loaded'))
      ..add(DiagnosticsProperty('repositories', repositories));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(repositories);

  @override
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required
        Result loadingNextPage(
            List<GitHubRepositoryEntity> currentRepositories),
    @required Result loaded(List<GitHubRepositoryEntity> repositories),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingNextPage != null);
    assert(loaded != null);
    assert(error != null);
    return loaded(repositories);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadingNextPage(List<GitHubRepositoryEntity> currentRepositories),
    Result loaded(List<GitHubRepositoryEntity> repositories),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(repositories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadingNextPage(_LoadingNextPage value),
    @required Result loaded(Loaded value),
    @required Result error(_Error value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingNextPage != null);
    assert(loaded != null);
    assert(error != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result loadingNextPage(_LoadingNextPage value),
    Result loaded(Loaded value),
    Result error(_Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements PublicGithubRepositoriesState {
  const factory Loaded({@required List<GitHubRepositoryEntity> repositories}) =
      _$Loaded;

  List<GitHubRepositoryEntity> get repositories;
  $LoadedCopyWith<Loaded> get copyWith;
}

abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

class __$ErrorCopyWithImpl<$Res>
    extends _$PublicGithubRepositoriesStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(_Error(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

class _$_Error with DiagnosticableTreeMixin implements _Error {
  const _$_Error({this.message});

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublicGithubRepositoriesState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PublicGithubRepositoriesState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required
        Result loadingNextPage(
            List<GitHubRepositoryEntity> currentRepositories),
    @required Result loaded(List<GitHubRepositoryEntity> repositories),
    @required Result error(String message),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingNextPage != null);
    assert(loaded != null);
    assert(error != null);
    return error(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadingNextPage(List<GitHubRepositoryEntity> currentRepositories),
    Result loaded(List<GitHubRepositoryEntity> repositories),
    Result error(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadingNextPage(_LoadingNextPage value),
    @required Result loaded(Loaded value),
    @required Result error(_Error value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadingNextPage != null);
    assert(loaded != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result loadingNextPage(_LoadingNextPage value),
    Result loaded(Loaded value),
    Result error(_Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PublicGithubRepositoriesState {
  const factory _Error({String message}) = _$_Error;

  String get message;
  _$ErrorCopyWith<_Error> get copyWith;
}
