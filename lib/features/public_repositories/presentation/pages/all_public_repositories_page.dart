import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_client_flutter/core/di/injection_container.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_bloc.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_event.dart';
import 'package:github_client_flutter/features/public_repositories/presentation/blocs/public_github_repositories_state.dart';

class AllPublicRepositoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PublicGithubRepositoriesBloc>(
      create: (context) =>
      sl<PublicGithubRepositoriesBloc>()
        ..add(GetPublicGitHubRepositoriesEvent(0)),
      child: BlocBuilder<PublicGithubRepositoriesBloc,
          PublicGithubRepositoriesState>(
        builder: (context, state) {
          return state.when(
              initial: () => Container(),
              loading: () => Container(),
              loaded: (repositories) =>
                  ListView.builder(
                      itemCount: repositories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.blue,
                          child: Center(child: Text(repositories[index].name)),
                        );
                      }),
              error: (message) => Container());

//          if (state is PublicGithubRepositoriesState.) {
//            return ListView.builder(
//                itemCount: state.repositories.length,
//                itemBuilder: (context, index) {
//                  return Container(
//                    color: Colors.blue,
//                    child: Center(child: Text(state.repositories[index].name)),
//                  );
//                });
//          } else {
//            return Container();
//          }
        },
      ),
    );
  }
}
