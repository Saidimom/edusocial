import 'package:edu_social/features/login/domain/repositories/login_repository.dart';
import 'package:edu_social/features/shared/domain/entities/user.dart';

class GetCurrentUserUsecase {
  final LoginRepository repository;
  const GetCurrentUserUsecase(this.repository);

  Future<User> call() {
    return repository.getCurrentUser();
  }
}
