import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/features/user_details/domain/entities/user_details_entity.dart';
import 'package:github_client_flutter/features/user_details/domain/use_cases/get_user_details_use_case.dart';
import 'package:injectable/injectable.dart';
import './bloc.dart';

@injectable
class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final GetUserDetailsUseCase getUserDetails;

  UserDetailsBloc({@required this.getUserDetails});

  @override
  UserDetailsState get initialState => UserDetailsState.initial();

  @override
  Stream<UserDetailsState> mapEventToState(
    UserDetailsEvent event,
  ) async* {
    yield const UserDetailsState.loading();
    yield* event.when(getDetails: (username) async* {
      yield await getUserDetails(UserDetailsParams(username: username))
          .then(_handleSuccess)
          .catchError(_handleError);
    });
  }

  UserDetailsState _handleSuccess(UserDetailsEntity details) =>
      UserDetailsState.loaded(details: details);

  UserDetailsState _handleError(e) => UserDetailsState.error(message: e?.message);
}
