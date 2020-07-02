import 'package:github_client_flutter/core/constants/db_boxes.dart';
import 'package:github_client_flutter/core/data/models/github_repository_model.dart';
import 'package:github_client_flutter/core/errors/exceptions.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

abstract class PublicGitHubRepositoriesLocalDataSource {
  Future savePublicGitHubRepositoriesToCache(List<GitHubRepositoryModel> repositories);

  Future<List<GitHubRepositoryModel>> getPublicGitHubRepositoriesFromCache();
}

@LazySingleton(as: PublicGitHubRepositoriesLocalDataSource)
class PublicGitHubRepositoriesLocalDataSourceImpl implements PublicGitHubRepositoriesLocalDataSource {

  @override
  Future<List<GitHubRepositoryModel>> getPublicGitHubRepositoriesFromCache() async {
    await _initBox();
    final publicRepositoriesBox = Hive.box(kPublicRepositoriesBoxName);
    final List<GitHubRepositoryModel> cacheRepositories =
        (publicRepositoriesBox.get('repositories') as List<dynamic>)
            ?.map((repo) => repo as GitHubRepositoryModel)
            ?.toList();

    if (cacheRepositories != null && cacheRepositories.isNotEmpty)
      return cacheRepositories;
    else
      return Future.error(CacheException(message: 'Проверьте ваше соединение с интернетом'));
  }

  @override
  Future savePublicGitHubRepositoriesToCache(List<GitHubRepositoryModel> repositories) async {
    await _initBox();
    final publicRepositoriesBox = Hive.box(kPublicRepositoriesBoxName);
    publicRepositoriesBox.put('repositories', repositories);
  }

  Future _initBox() async {
    if (!Hive.isBoxOpen(kPublicRepositoriesBoxName)) {
      await Hive.openBox(kPublicRepositoriesBoxName);
    }
  }
}
