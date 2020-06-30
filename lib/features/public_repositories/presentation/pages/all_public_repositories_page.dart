import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_client_flutter/core/di/injection_container.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_bloc.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_event.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_state.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/widgets/git_hub_public_repo_card.dart';

class AllPublicRepositoriesPage extends StatefulWidget {
  @override
  _AllPublicRepositoriesPageState createState() =>
      _AllPublicRepositoriesPageState();
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
    return BlocProvider<PublicGithubRepositoriesBloc>(
      create: (context) => sl<PublicGithubRepositoriesBloc>()
        ..add(PublicGithubRepositoriesEvent.getRepositories()),
      child: BlocConsumer<PublicGithubRepositoriesBloc,
          PublicGithubRepositoriesState>(
        listener: (context, state) {
          state.maybeWhen(
              loaded: (repositories) {
                _refreshCompleter?.complete();
                _refreshCompleter = Completer();
              },
              error: (message){
                _refreshCompleter?.complete();
                _refreshCompleter = Completer();

                final snackBar = new SnackBar(content: new Text('Ошибка'),
                    backgroundColor: Colors.red);
                Scaffold.of(context).showSnackBar(snackBar);
              },
              orElse: () {});
        },
        builder: (context, state) {
          return state.when(
            initial: () => Container(),
            loading: () => Center(child: CircularProgressIndicator()),
            loaded: (repositories) =>
                _buildRepositoriesList(repositories, false, context),
            error: (message) => Center(child: Text(message)),
            loadingNextPage: (repositories) =>
                _buildRepositoriesList(repositories, true, context),
          );
        },
      ),
    );
  }

  Widget _buildRepositoriesList(List<GitHubRepositoryEntity> repositories,
      bool isLoadingNextPage, BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) => isLoadingNextPage
          ? false
          : _handleScrollNotification(scrollNotification, context),
      child: RefreshIndicator(
        onRefresh: () async {
          context.bloc<PublicGithubRepositoriesBloc>().add(
              PublicGithubRepositoriesEvent.getRepositories(isRefresh: true));
          return _refreshCompleter.future;
        },
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: isLoadingNextPage
                ? repositories.length + 1
                : repositories.length,
            controller: _scrollController,
            itemBuilder: (context, index) {
              return Align(
                child: index >= repositories.length
                    ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    )
                    : GitHubPublicRepoCard(
                        name: repositories[index].name,
                        description: repositories[index].description,
                      ),
              );
            }),
      ),
    );
  }

  bool _handleScrollNotification(
      ScrollNotification notification, BuildContext context) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter <= 500) {
      context
          .bloc<PublicGithubRepositoriesBloc>()
          .add(PublicGithubRepositoriesEvent.getRepositories());
    }
    return false;
  }
}
