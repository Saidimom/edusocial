import 'package:edu_social/features/login/domain/repositories/login_repository.dart';
import 'package:edu_social/features/shared/domain/entities/user.dart';

class LoginUsecase {
  final LoginRepository repository;
  LoginUsecase(this.repository);

  Future<User> call(String username, String password) {
    return repository.login(username, password);
  }
}
