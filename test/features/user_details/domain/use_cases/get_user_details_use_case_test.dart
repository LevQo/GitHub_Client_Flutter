import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/features/user_details/domain/entities/user_details_entity.dart';
import 'package:github_client_flutter/features/user_details/domain/repositories/user_details_repository.dart';
import 'package:github_client_flutter/features/user_details/domain/use_cases/get_user_details_use_case.dart';
import 'package:mockito/mockito.dart';

class MockUserDetailsRepository extends Mock implements UserDetailsRepository {}

void main() {
  MockUserDetailsRepository mockRepository;
  GetUserDetailsUseCase useCase;

  setUp(() {
    mockRepository = MockUserDetailsRepository();
    useCase = GetUserDetailsUseCase(repository: mockRepository);
  });

  final tUserDetails = UserDetailsEntity(
      login: 'octocat',
      name: 'monalisa octocat',
      avatarUrl: 'https://github.com/images/error/octocat_happy.gif',
      followers: 20,
      following: 0,
      bio: 'There once was...',
      company: 'GitHub',
      location: 'San Francisco');

  test('should return user details', () async {
    // arrange
    when(mockRepository.getUserDetails(any)).thenAnswer((_) async => tUserDetails);
    // act
    final result = await useCase(UserDetailsParams(username: ''));
    // assert
    expect(result, tUserDetails);
    verify(mockRepository.getUserDetails(''));
  });
}
