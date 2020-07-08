// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/pages/all_public_repositories_page.dart';
import 'package:github_client_flutter/features/repository_details/presentation/pages/repository_details_page.dart';
import 'package:github_client_flutter/features/user_details/presentation/pages/user_details_page.dart';

abstract class Routes {
  static const repositoriesPage = '/';
  static const repositoryDetailsPage = '/repository-details-page';
  static const userDetailsPage = '/user-details-page';
  static const all = {
    repositoriesPage,
    repositoryDetailsPage,
    userDetailsPage,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.repositoriesPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => AllPublicRepositoriesPage(),
          settings: settings,
        );
      case Routes.repositoryDetailsPage:
        if (hasInvalidArgs<RepositoryDetailsPageArguments>(args,
            isRequired: true)) {
          return misTypedArgsRoute<RepositoryDetailsPageArguments>(args);
        }
        final typedArgs = args as RepositoryDetailsPageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => RepositoryDetailsPage(
              owner: typedArgs.owner, repo: typedArgs.repo),
          settings: settings,
        );
      case Routes.userDetailsPage:
        if (hasInvalidArgs<UserDetailsPageArguments>(args)) {
          return misTypedArgsRoute<UserDetailsPageArguments>(args);
        }
        final typedArgs =
            args as UserDetailsPageArguments ?? UserDetailsPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => UserDetailsPage(username: typedArgs.username),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//RepositoryDetailsPage arguments holder class
class RepositoryDetailsPageArguments {
  final String owner;
  final String repo;
  RepositoryDetailsPageArguments({@required this.owner, @required this.repo});
}

//UserDetailsPage arguments holder class
class UserDetailsPageArguments {
  final String username;
  UserDetailsPageArguments({this.username});
}
