import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_client_flutter/core/blocs/bloc.dart';
import 'package:github_client_flutter/core/di/injection_container.dart' as di;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:github_client_flutter/features/public_repositories/presentation/pages/all_public_repositories_page.dart';
import 'package:github_client_flutter/core/data/models/github_repository_model.dart';
import 'package:hive/hive.dart';

import 'core/blocs/main_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.configureDependencies();
  await _initHive();
  runApp(MyApp());
}

Future _initHive() async {
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(GitHubRepositoryModelAdapter());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => MainBloc(),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return state.when(
            openTab: (indexPage) => MaterialApp(
              title: 'GitHubClient',
              theme: ThemeData(),
              home: Scaffold(
                appBar: AppBar(title: Text('GitHubClient')),
                body: IndexedStack(
                  index: indexPage,
                  children: <Widget>[AllPublicRepositoriesPage(), Container(color: Colors.white)],
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: indexPage,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
