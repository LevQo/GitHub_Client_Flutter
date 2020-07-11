import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_client_flutter/core/di/injection_container.dart';
import 'package:github_client_flutter/core/routes/router.gr.dart';
import 'package:github_client_flutter/core/widgets/error_container.dart';
import 'package:github_client_flutter/features/repository_details/domain/entities/repository_details_entity.dart';
import 'package:github_client_flutter/features/repository_details/domain/use_cases/get_details_use_case.dart';
import 'package:github_client_flutter/features/repository_details/presentation/blocs/bloc.dart';
import 'package:github_client_flutter/features/repository_details/presentation/widgets/repository_info_card.dart';
import 'package:github_client_flutter/core/utils/extentions.dart';
import 'package:github_client_flutter/features/repository_details/presentation/widgets/user_card.dart';
import 'package:github_client_flutter/features/user_details/domain/use_cases/get_user_details_use_case.dart';

class RepositoryDetailsPage extends StatelessWidget {
  final String owner;
  final String repo;

  const RepositoryDetailsPage({@required this.owner, @required this.repo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RepositoryDetailsBloc(getRepositoryDetails: sl<GetRepositoryDetailsUseCase>())
        ..add(RepositoryDetailsEvent.getDetails(owner: owner, repo: repo)),
      child: BlocBuilder<RepositoryDetailsBloc, RepositoryDetailsState>(
        builder: (context, state) {
          return state.when(
              initial: _buildInitialState,
              loading: _buildLoadingState,
              loaded: (details) => _buildLoadedState(context, details),
              error: (message) => _buildErrorContainer(context, message: message));
        },
      ),
    );
  }

  Scaffold _buildInitialState() {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Container(),
    );
  }

  Scaffold _buildLoadingState() {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Scaffold _buildErrorContainer(BuildContext context, {String message}) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ErrorContainer(
            message: message,
            onRetry: () => context
                .bloc<RepositoryDetailsBloc>()
                .add(RepositoryDetailsEvent.getDetails(owner: owner, repo: repo)),
          ),
        ),
      ),
    );
  }

  Scaffold _buildLoadedState(BuildContext context, RepositoryDetailsEntity details) {
    return Scaffold(
      appBar: AppBar(title: Text(details.fullName ?? '')),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: context.screenHeight * 0.9,
          child: Column(
            children: <Widget>[
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InfoCard(
                    text: 'Watch',
                    count: details.watchersCount?.toString(),
                    icon: Icon(
                      Icons.remove_red_eye,
                      size: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  InfoCard(
                    text: 'Star ',
                    count: details.stargazersCount?.toString(),
                    icon: Icon(
                      Icons.star,
                      size: 16.0,
                      color: Colors.white,
                    ),
                  ),
                  InfoCard(
                    text: 'Fork ',
                    count: details.forksCount?.toString(),
                    icon: Icon(
                      Icons.category,
                      size: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Container(height: 1.0, width: context.screenWidth * 0.8, color: Colors.grey),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(details.description ?? '-'),
              ),
              Container(height: 1.0, width: context.screenWidth * 0.8, color: Colors.grey),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () => ExtendedNavigator.of(context).pushNamed(
                  Routes.userDetailsPage,
                  arguments: UserDetailsPageArguments(username: details.ownerLogin, useCase: sl<GetUserDetailsUseCase>()),
                ),
                child: UserCard(avatarUrl: details.avatarUrl, login: details.ownerLogin),
              )
            ],
          ),
        ),
      ),
    );
  }
}
