import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/features/repository_details/domain/entities/repository_details_entity.dart';
import 'package:github_client_flutter/features/repository_details/domain/repositories/repository_details_repository.dart';
import 'package:github_client_flutter/features/repository_details/domain/use_cases/get_details_use_case.dart';
import 'package:mockito/mockito.dart';

class MockRepositoryDetailsRepository extends Mock implements RepositoryDetailsRepository {}

void main() {
  MockRepositoryDetailsRepository mockRepository;
  GetRepositoryDetailsUseCase useCase;

  setUp(() {
    mockRepository = MockRepositoryDetailsRepository();
    useCase = GetRepositoryDetailsUseCase(repository: mockRepository);
  });

  final tDetails = RepositoryDetailsEntity(
      fullName: 'octocat/Hello-World',
      description: 'This your first repo!',
      watchersCount: 80,
      stargazersCount: 80,
      forksCount: 9,
      ownerLogin: 'octocat',
      avatarUrl: 'https://github.com/images/error/octocat_happy.gif');

  test('should get repository details', () async {
    // arrange
    when(mockRepository.getRepositoryDetails(any, any)).thenAnswer((_) async => tDetails);
    // act
    final result = await useCase(RepositoryDetailsParams(owner: '', repo: ''));
    // assert
    expect(result, tDetails);
    verify(mockRepository.getRepositoryDetails('', ''));
  });
}
