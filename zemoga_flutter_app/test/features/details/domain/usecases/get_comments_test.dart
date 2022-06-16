import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:zemoga_flutter_app/core/usercases/usecases.dart';
import 'package:zemoga_flutter_app/features/details/domain/entities/comment.dart';
import 'package:zemoga_flutter_app/features/details/domain/repositories/details_repository.dart';
import 'package:zemoga_flutter_app/features/details/domain/usecases/get_details.dart';

import 'get_comments_test.mocks.dart';

@GenerateMocks([DetailsRepository])
void main() {
  late GetDetails usecase;
  late MockDetailsRepository mockDetailsRepository;

  setUp(() {
    mockDetailsRepository = MockDetailsRepository();
    usecase = GetDetails(repository: mockDetailsRepository);
  });

  List<Comment> testComments = [
    const Comment(
      body: 'Body',
      email: 'Email',
      id: 1,
      name: 'Name',
      postId: 1,
    ),
    const Comment(
      body: 'Body 2',
      email: 'Email 2',
      id: 2,
      name: 'Name 2',
      postId: 2,
    ),
  ];

  test('Should get comments list from the repository', () async {
    when(mockDetailsRepository.getComments())
        .thenAnswer((realInvocation) async => Right(testComments));
    final result = await usecase.callComments(NoParams());

    expect(result, Right(testComments));
    verify(mockDetailsRepository.getComments());
    verifyNoMoreInteractions(mockDetailsRepository);
  });
}
