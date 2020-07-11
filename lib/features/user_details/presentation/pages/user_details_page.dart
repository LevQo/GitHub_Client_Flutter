import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_client_flutter/core/di/injection_container.dart';
import 'package:github_client_flutter/core/utils/extentions.dart';
import 'package:github_client_flutter/core/widgets/error_container.dart';
import 'package:github_client_flutter/features/user_details/domain/entities/user_details_entity.dart';
import 'package:github_client_flutter/features/user_details/domain/use_cases/get_user_details_use_case.dart';
import 'package:github_client_flutter/features/user_details/presentation/blocs/bloc.dart';

class UserDetailsPage extends StatelessWidget {
  final String username;
  final GetUserDetailsUseCase useCase;

  const UserDetailsPage({@required this.username, @required this.useCase});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserDetailsBloc>(
      create: (context) => UserDetailsBloc(getUserDetails: useCase)
        ..add(UserDetailsEvent.getDetails(username: username)),
      child: BlocBuilder<UserDetailsBloc, UserDetailsState>(
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
            onRetry: () =>
                context.bloc<UserDetailsBloc>().add(UserDetailsEvent.getDetails(username: username)),
          ),
        ),
      ),
    );
  }

  Scaffold _buildLoadedState(BuildContext context, UserDetailsEntity details) {
    return Scaffold(
      appBar: AppBar(title: Text(details.login)),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: context.screenHeight * 0.9,
          child: Column(
            children: <Widget>[
              SizedBox(height: 16.0),
              Hero(
                tag: 'avatar',
                child: CircleAvatar(
                  radius: context.screenHeight * 0.1,
                  backgroundImage: NetworkImage(details.avatarUrl),
                ),
              ),
              SizedBox(height: 16.0),
              Text(details.name ?? '', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
              SizedBox(height: 16.0),
              Text('${details.followers} followers - ${details.following} following',
                  style: TextStyle(fontSize: 16.0)),
              SizedBox(height: 16.0),
              Container(height: 1.0, width: context.screenWidth * 0.8, color: Colors.grey),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(details.bio ?? '-'),
              ),
              Container(height: 1.0, width: context.screenWidth * 0.8, color: Colors.grey),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('🏢 ${details.company ?? '-'}'),
                    Text('📍 ${details.location ?? '-'}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
