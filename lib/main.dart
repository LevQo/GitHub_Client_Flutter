import 'package:flutter/material.dart';
import 'package:github_client_flutter/core/di/injection_container.dart' as di;
import 'package:github_client_flutter/features/public_repositories/presentation/pages/all_public_repositories_page.dart';

void main()  {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHubClient',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(title: Text('GitHubClient')),
        body: IndexedStack(
          index: 0,
          children: <Widget>[
            AllPublicRepositoriesPage(),
            Container(color: Colors.white)
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {},
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
    );
  }
}
