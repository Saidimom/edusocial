import 'package:edu_social/features/auth/domain/repositories/auth_repository.dart';
import 'package:edu_social/features/shared/domain/entities/user.dart';

class GetCurrentUserUsecase {
  final AuthRepository repository;
  const GetCurrentUserUsecase(this.repository);

  Future<User> call() {
    return repository.getCurrentUser();
  }
}
