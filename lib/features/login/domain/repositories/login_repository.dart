import 'package:edu_social/features/shared/domain/entities/user.dart';

abstract class LoginRepository {
  Future<User> login(String username, String password);

  Future<User> getCurrentUser();
}
