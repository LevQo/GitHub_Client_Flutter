import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';
import 'package:github_client_flutter/features/public_repositories/domain/repositories/public_github_repos_repository.dart';
import 'package:github_client_flutter/features/public_repositories/domain/use_cases/get_public_github_repositories.dart';
import 'package:mockito/mockito.dart';

class MockAllGithubReposRepository extends Mock
    implements PublicGitHubReposRepository {}

void main() {
  MockAllGithubReposRepository mockAllGithubReposRepository;
  GetPublicGitHubRepositories usecase;

  setUp(() {
    mockAllGithubReposRepository = MockAllGithubReposRepository();
    usecase = GetPublicGitHubRepositories(mockAllGithubReposRepository);
  });

  final List<GitHubRepositoryEntity> tGithubRepositories = [
    GitHubRepositoryEntity(id: 0, name: 'name', description: 'description', url: 'url')
  ];

  test('should get all public github repositories', () async {
    // arrange
    when(mockAllGithubReposRepository.getPublicGitHubRepositories(any))
        .thenAnswer((_) async => Right(tGithubRepositories));
    // act
    final result = await usecase(Params(lastRepoId: 100));
    //assert
    expect(result, Right(tGithubRepositories));
    verify(mockAllGithubReposRepository.getPublicGitHubRepositories(100));
    verifyNoMoreInteractions(mockAllGithubReposRepository);
  });
}
