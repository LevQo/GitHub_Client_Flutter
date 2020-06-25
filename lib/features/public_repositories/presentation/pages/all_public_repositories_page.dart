import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_client_flutter/core/di/injection_container.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_bloc.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_event.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_state.dart';

class AllPublicRepositoriesPage extends StatefulWidget {
  @override
  _AllPublicRepositoriesPageState createState() =>
      _AllPublicRepositoriesPageState();
}

class _AllPublicRepositoriesPageState extends State<AllPublicRepositoriesPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PublicGithubRepositoriesBloc>(
      create: (context) => sl<PublicGithubRepositoriesBloc>()
        ..add(PublicGithubRepositoriesEvent.getRepositories()),
      child: BlocBuilder<PublicGithubRepositoriesBloc,
          PublicGithubRepositoriesState>(
        builder: (context, state) {
          return state.maybeWhen(
              initial: () => Container(),
              loading: () => Container(),
              loaded: (repositories) =>
                  NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) =>
                        _handleScrollNotification(scrollNotification, context),
                    child: GestureDetector(
                      onTap: () {
                        context.bloc<PublicGithubRepositoriesBloc>().add(
                            PublicGithubRepositoriesEvent.getRepositories());
                      },
                      child: ListView.builder(
                          itemCount: repositories.length,
                          controller: _scrollController,
                          itemBuilder: (context, index) {
                            return Container(
                              color: Colors.blue,
                              child: Center(
                                child: Text(
                                  repositories[index].id.toString(),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
              error: (message) => Container(),
              orElse: () => Container());
        },
      ),
    );
  }

  bool _handleScrollNotification(
      ScrollNotification notification, BuildContext context) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      context
          .bloc<PublicGithubRepositoriesBloc>()
          .add(PublicGithubRepositoriesEvent.getRepositories());
    }
    return false;
  }
}
