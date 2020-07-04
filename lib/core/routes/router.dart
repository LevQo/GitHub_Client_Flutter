import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_client_flutter/features/repository_details/presentation/pages/repository_details_page.dart';

import '../main_page.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  MainPage mainPage;
  @CustomRoute(
      fullscreenDialog: true, transitionsBuilder: TransitionsBuilders.zoomIn, durationInMilliseconds: 200)
  RepositoryDetailsPage repositoryDetailsPage;
}
