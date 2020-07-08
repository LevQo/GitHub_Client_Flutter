import 'package:auto_route/auto_route_annotations.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/pages/all_public_repositories_page.dart';
import 'package:github_client_flutter/features/repository_details/presentation/pages/repository_details_page.dart';
import 'package:github_client_flutter/features/user_details/presentation/pages/user_details_page.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  AllPublicRepositoriesPage repositoriesPage;
  @MaterialRoute()
  RepositoryDetailsPage repositoryDetailsPage;
  @MaterialRoute()
  UserDetailsPage userDetailsPage;
}
