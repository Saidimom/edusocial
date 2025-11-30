import 'package:edu_social/features/auth/domain/repositories/auth_repository.dart';
import 'package:edu_social/features/shared/domain/entities/user.dart';

class LoginUsecase {
  final AuthRepository repository;
  LoginUsecase(this.repository);

  Future<User> call(String username, String password) {
    return repository.login(username, password);
  }
}
