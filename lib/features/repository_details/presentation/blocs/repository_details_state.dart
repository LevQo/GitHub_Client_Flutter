import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_client_flutter/features/repository_details/domain/entities/repository_details_entity.dart';

part 'repository_details_state.freezed.dart';

@freezed
abstract class RepositoryDetailsState with _$RepositoryDetailsState {
  const factory RepositoryDetailsState.initial() = _Initial;
  const factory RepositoryDetailsState.loading() = _Loading;
  const factory RepositoryDetailsState.loaded({@required RepositoryDetailsEntity details}) = _Loaded;
  const factory RepositoryDetailsState.error({String message}) = _Error;
}
