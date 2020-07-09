import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_client_flutter/core/di/injection_container.dart';
import 'package:github_client_flutter/core/routes/router.gr.dart';
import 'package:github_client_flutter/core/widgets/error_container.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_bloc.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_event.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_state.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/widgets/git_hub_public_repo_card.dart';

class AllPublicRepositoriesPage extends StatefulWidget {
  @override
  _AllPublicRepositoriesPageState createState() => _AllPublicRepositoriesPageState();
}

class _AllPublicRepositoriesPageState extends State<AllPublicRepositoriesPage> {
  final _scrollController = ScrollController();
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Repositories')),
      body: BlocProvider<PublicGithubRepositoriesBloc>(
        create: (context) => sl<PublicGithubRepositoriesBloc>()
          ..add(PublicGithubRepositoriesEvent.getRepositories(isRefresh: false)),
        child: BlocConsumer<PublicGithubRepositoriesBloc, PublicGithubRepositoriesState>(
          listener: (context, state) {
            state.maybeWhen(
                loaded: (repositories, isCache, snackMessage) {
                  _hideRefreshProgress();
                  if (snackMessage != null) _showSnackBar(snackMessage, context);
                },
                error: (message) => _hideRefreshProgress(),
                orElse: () {});
          },
          builder: (context, state) {
            return state.when(
              initial: () => Container(),
              loading: () => Center(child: CircularProgressIndicator()),
              loaded: (repositories, isCache, snackMessage) =>
                  _buildRepositoriesList(repositories, false, isCache, context),
              error: (message) => _buildErrorContainer(message, context),
              loadingNextPage: (repositories) => _buildRepositoriesList(repositories, true, false, context),
            );
          },
        ),
      ),
    );
  }

  Widget _buildErrorContainer(String message, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ErrorContainer(
          message: message,
          onRetry: () => _getRepositories(context: context),
        ),
      ),
    );
  }

  Widget _buildRepositoriesList(
      List<GitHubRepositoryEntity> repositories, bool isLoadingNextPage, bool isCache, BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) =>
          isLoadingNextPage ? false : _handleScrollNotification(scrollNotification, isCache, context),
      child: RefreshIndicator(
        onRefresh: () async {
          _getRepositories(context: context, isRefresh: true);
          return _refreshCompleter.future;
        },
        child: Scrollbar(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: isLoadingNextPage ? repositories.length + 1 : repositories.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return Align(
                  child: index >= repositories.length
                      ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(),
                        )
                      : GitHubPublicRepoCard(
                          onTap: (owner, repo) {
                            ExtendedNavigator.of(context).pushNamed(Routes.repositoryDetailsPage,
                                arguments: RepositoryDetailsPageArguments(owner: owner, repo: repo));
                          },
                          name: repositories[index].name,
                          description: repositories[index].description,
                          owner: repositories[index].owner,
                        ),
                );
              }),
        ),
      ),
    );
  }

  void _getRepositories({BuildContext context, bool isRefresh = false}) {
    context
        .bloc<PublicGithubRepositoriesBloc>()
        .add(PublicGithubRepositoriesEvent.getRepositories(isRefresh: isRefresh));
  }

  bool _handleScrollNotification(ScrollNotification notification, bool isCache, BuildContext context) {
    if (notification is ScrollEndNotification && _scrollController.position.extentAfter <= 500) {
      if (isCache != true) _getRepositories(context: context);
    }
    return false;
  }

  void _showSnackBar(String message, BuildContext context) {
    final snackBar = new SnackBar(content: new Text(message), backgroundColor: Colors.red);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void _hideRefreshProgress() {
    _refreshCompleter?.complete();
    _refreshCompleter = Completer();
  }
}
