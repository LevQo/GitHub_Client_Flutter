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
      create: (context) => sl<PublicGithubRepositoriesBloc>()
        ..add(GetPublicGitHubRepositoriesEvent(0)),
      child: BlocBuilder<PublicGithubRepositoriesBloc,
          PublicGithubRepositoriesState>(
        builder: (context, state) {
          if (state is LoadedState) {
            return ListView.builder(
                itemCount: state.repositories.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.blue,
                    child: Center(child: Text(state.repositories[index].name)),
                  );
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
