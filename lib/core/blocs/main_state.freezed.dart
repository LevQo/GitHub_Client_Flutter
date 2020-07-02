// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$MainStateTearOff {
  const _$MainStateTearOff();

  _OpenTab openTab({@required int index}) {
    return _OpenTab(
      index: index,
    );
  }
}

// ignore: unused_element
const $MainState = _$MainStateTearOff();

mixin _$MainState {
  int get index;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result openTab(int index),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result openTab(int index),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result openTab(_OpenTab value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result openTab(_OpenTab value),
    @required Result orElse(),
  });

  $MainStateCopyWith<MainState> get copyWith;
}

abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res>;
  $Res call({int index});
}

class _$MainStateCopyWithImpl<$Res> implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  final MainState _value;
  // ignore: unused_field
  final $Res Function(MainState) _then;

  @override
  $Res call({
    Object index = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed ? _value.index : index as int,
    ));
  }
}

abstract class _$OpenTabCopyWith<$Res> implements $MainStateCopyWith<$Res> {
  factory _$OpenTabCopyWith(_OpenTab value, $Res Function(_OpenTab) then) =
      __$OpenTabCopyWithImpl<$Res>;
  @override
  $Res call({int index});
}

class __$OpenTabCopyWithImpl<$Res> extends _$MainStateCopyWithImpl<$Res>
    implements _$OpenTabCopyWith<$Res> {
  __$OpenTabCopyWithImpl(_OpenTab _value, $Res Function(_OpenTab) _then)
      : super(_value, (v) => _then(v as _OpenTab));

  @override
  _OpenTab get _value => super._value as _OpenTab;

  @override
  $Res call({
    Object index = freezed,
  }) {
    return _then(_OpenTab(
      index: index == freezed ? _value.index : index as int,
    ));
  }
}

class _$_OpenTab implements _OpenTab {
  const _$_OpenTab({@required this.index}) : assert(index != null);

  @override
  final int index;

  @override
  String toString() {
    return 'MainState.openTab(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OpenTab &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(index);

  @override
  _$OpenTabCopyWith<_OpenTab> get copyWith =>
      __$OpenTabCopyWithImpl<_OpenTab>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result openTab(int index),
  }) {
    assert(openTab != null);
    return openTab(index);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result openTab(int index),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (openTab != null) {
      return openTab(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result openTab(_OpenTab value),
  }) {
    assert(openTab != null);
    return openTab(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result openTab(_OpenTab value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (openTab != null) {
      return openTab(this);
    }
    return orElse();
  }
}

abstract class _OpenTab implements MainState {
  const factory _OpenTab({@required int index}) = _$_OpenTab;

  @override
  int get index;
  @override
  _$OpenTabCopyWith<_OpenTab> get copyWith;
}
