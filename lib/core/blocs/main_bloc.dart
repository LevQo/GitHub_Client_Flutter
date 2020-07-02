import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  @override
  MainState get initialState => MainState.openTab(index: 0);

  @override
  Stream<MainState> mapEventToState(
    MainEvent event,
  ) async* {
    yield event.when(openTab: (index) => MainState.openTab(index: index));
  }
}
