import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/features/public_repositories/data/models/public_github_repositories_ui_model.dart';
import 'package:github_client_flutter/features/public_repositories/domain/entities/github_repository_entity.dart';
import 'package:github_client_flutter/features/public_repositories/domain/repositories/public_github_repos_repository.dart';
import 'package:github_client_flutter/features/public_repositories/domain/use_cases/get_public_github_repositories.dart';
import 'package:mockito/mockito.dart';

class MockPublicGithubReposRepository extends Mock implements PublicGitHubReposRepository {}

void main() {
  MockPublicGithubReposRepository mockPublicGithubReposRepository;
  GetPublicGitHubRepositories useCase;

  setUp(() {
    mockPublicGithubReposRepository = MockPublicGithubReposRepository();
    useCase = GetPublicGitHubRepositories(mockPublicGithubReposRepository);
  });

  final List<GitHubRepositoryEntity> tGithubRepositories = [
    GitHubRepositoryEntity(id: 0, name: 'name', description: 'description', url: 'url', owner: 'owner')
  ];

  final tResultUiModel = PublicGithubRepositoriesUiModel(repositories: tGithubRepositories);

  test('should get public github repositories', () async {
    // arrange
    when(mockPublicGithubReposRepository.getPublicGitHubRepositories(any))
        .thenAnswer((_) async => tResultUiModel);
    // act
    final result = await useCase(Params(lastRepoId: null));
    // assert
    expect(result, tResultUiModel);
    verify(mockPublicGithubReposRepository.getPublicGitHubRepositories(null));
    verifyNoMoreInteractions(mockPublicGithubReposRepository);
  });
}
