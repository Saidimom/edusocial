import 'package:edu_social/features/auth/domain/repositories/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository authRepository;

  LogoutUsecase({required this.authRepository});

  Future<void> call() {
    return authRepository.logout();
  }
}
