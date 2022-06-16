import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:zemoga_flutter_app/features/details/domain/entities/user.dart';
import 'package:zemoga_flutter_app/features/details/domain/repositories/details_repository.dart';
import 'package:zemoga_flutter_app/features/details/domain/usecases/get_details.dart';

import 'get_user_test.mocks.dart';

@GenerateMocks([DetailsRepository])
void main() {
  late GetDetails usecase;
  late MockDetailsRepository mockDetailsRepository;

  setUp(() {
    mockDetailsRepository = MockDetailsRepository();
    usecase = GetDetails(repository: mockDetailsRepository);
  });

  User testUser = const User(
    email: 'Email',
    id: 1,
    name: 'Name',
    phone: 'phone',
    username: 'Username',
    website: 'Website',
  );

  test('Should get user from the repository', () async {
    when(mockDetailsRepository.getUser(testUser.id))
        .thenAnswer((realInvocation) async => Right(testUser));
    final result = await usecase.callUser(testUser.id);

    expect(result, Right(testUser));
    verify(mockDetailsRepository.getUser(testUser.id));
  });
}
