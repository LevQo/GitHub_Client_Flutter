import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_client_flutter/features/user_details/domain/entities/user_details_entity.dart';
import 'package:meta/meta.dart';

part 'user_details_state.freezed.dart';

@freezed
abstract class UserDetailsState with _$UserDetailsState{
  const factory UserDetailsState.initial() = _Initial;
  const factory UserDetailsState.loading() = _Loading;
  const factory UserDetailsState.loaded({@required UserDetailsEntity details}) = _Loaded;
  const factory UserDetailsState.error({String message}) = _Error;
}
