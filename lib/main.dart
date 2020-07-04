import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/core/data/models/github_repository_model.dart';
import 'package:github_client_flutter/core/di/injection_container.dart' as di;
import 'package:github_client_flutter/core/routes/router.gr.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

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
    return MaterialApp(
      title: 'GitHubClient',
      theme: ThemeData(),
      builder: ExtendedNavigator<Router>(
        router: Router(),
        initialRoute: Routes.mainPage,
      ),
    );
  }
}
