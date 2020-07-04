import 'package:flutter/material.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/pages/all_public_repositories_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/main_bloc.dart';
import 'blocs/main_event.dart';
import 'blocs/main_state.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => MainBloc(),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('GitHubClient')),
            body: IndexedStack(
              index: state.index,
              children: <Widget>[AllPublicRepositoriesPage(), Container(color: Colors.white)],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.index,
              onTap: (index) {
                context.bloc<MainBloc>().add(MainEvent.openTab(index: index));
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  title: Text('Repositories'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle),
                  title: Text('Users'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
