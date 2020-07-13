import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_client_flutter/features/user_details/domain/entities/user_details_entity.dart';
import 'package:github_client_flutter/features/user_details/domain/use_cases/get_user_details_use_case.dart';
import 'package:mockito/mockito.dart';

class MockGetUserDetailsUseCase extends Mock implements GetUserDetailsUseCase {}

void main() {
  MockGetUserDetailsUseCase mockGetUserDetailsUseCase;

  setUp(() {
    mockGetUserDetailsUseCase = MockGetUserDetailsUseCase();
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

//  testWidgets('should show initial empty state ', (WidgetTester tester) async {
//    Widget testWidget = MediaQuery(
//        data: MediaQueryData(),
//        child: MaterialApp(home: UserDetailsPage(username: 'octocat', useCase: mockGetUserDetailsUseCase))
//    );
//
//    when(mockGetUserDetailsUseCase(any)).thenAnswer((_) async => tUserDetails);
//
//    await tester.pumpWidget(testWidget);
//
//    final appBarTitleFinder = find.text('octocat');
//    expect(appBarTitleFinder, findsNothing);
//  });

//  testWidgets('should show initial empty state ', (WidgetTester tester) async {
//    Widget testWidget = MediaQuery(
//        data: MediaQueryData(),
//        child: MaterialApp(home: UserDetailsPage(username: 'octocat', useCase: mockGetUserDetailsUseCase))
//    );
//
//    when(mockGetUserDetailsUseCase(any)).thenAnswer((_) async => tUserDetails);
//
//    await tester.pumpAndSettle();
//
//    final appBarTitleFinder = find.text('octocat');
//    expect(appBarTitleFinder, findsNothing);
//  });
}
