import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:zemoga_flutter_app/core/usercases/usecases.dart';
import 'package:zemoga_flutter_app/features/main/domain/entities/post.dart';
import 'package:zemoga_flutter_app/features/main/domain/repositories/post_repository.dart';
import 'package:zemoga_flutter_app/features/main/domain/usecases/get_posts.dart';

import 'get_post_test.mocks.dart';

@GenerateMocks([PostRepository])
void main() {
  late GetPosts usecase;
  late MockPostRepository mockPostRepository;

  setUp(() {
    mockPostRepository = MockPostRepository();
    usecase = GetPosts(repository: mockPostRepository);
  });

  List<Post> testPost = [
    const Post(body: 'Test', id: 1, title: 'Post Title', userId: 1),
    const Post(body: 'Test 2', id: 2, title: 'Post Title 2', userId: 2),
  ];

  test('Should get post list from the repository', () async {
    when(mockPostRepository.getPostsList())
        .thenAnswer((realInvocation) async => Right(testPost));
    final result = await usecase(NoParams());

    expect(result, Right(testPost));
    verify(mockPostRepository.getPostsList());
    verifyNoMoreInteractions(mockPostRepository);
  });
}
