import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/features/repository_details/domain/entities/repository_details_entity.dart';
import 'package:github_client_flutter/features/repository_details/domain/use_cases/get_details_use_case.dart';
import 'package:injectable/injectable.dart';
import './bloc.dart';

@injectable
class RepositoryDetailsBloc extends Bloc<RepositoryDetailsEvent, RepositoryDetailsState> {
  final GetDetailsRepositoryUseCase getRepositoryDetails;

  RepositoryDetailsBloc({@required this.getRepositoryDetails});

  @override
  RepositoryDetailsState get initialState => RepositoryDetailsState.initial();

  @override
  Stream<RepositoryDetailsState> mapEventToState(
    RepositoryDetailsEvent event,
  ) async* {
    yield* event.when(getDetails: (owner, repo) async* {
      yield const RepositoryDetailsState.loading();
      yield await getRepositoryDetails(RepositoryDetailsParams(owner: owner, repo: repo))
          .then(_handleSuccess)
          .catchError(_handleError);
    });
  }

  RepositoryDetailsState _handleSuccess(RepositoryDetailsEntity details) =>
      RepositoryDetailsState.loaded(details: details);

  RepositoryDetailsState _handleError(e) => RepositoryDetailsState.error(message: e?.message);
}
