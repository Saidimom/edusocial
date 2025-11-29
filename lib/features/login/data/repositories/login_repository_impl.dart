import 'package:edu_social/features/login/data/datasources/login_data_source.dart';
import 'package:edu_social/features/login/domain/repositories/login_repository.dart';
import 'package:edu_social/features/shared/data/models/user_model.dart';
import 'package:edu_social/features/shared/domain/entities/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginDataSource loginDataSource;
  final FlutterSecureStorage secureStorage;

  LoginRepositoryImpl({required this.loginDataSource, FlutterSecureStorage? secureStorage})
    : secureStorage = secureStorage ?? const FlutterSecureStorage();

  @override
  Future<User> login(String username, String password) async {
    final json = await loginDataSource.login(username, password);
    if (json.containsKey('accessToken') && json['accessToken'] != null) {
      final accessToken = json['accessToken'] as String;
      await secureStorage.write(key: 'accessToken', value: accessToken);
    }
    if (json.containsKey('refreshToken') && json['refreshToken'] != null) {
      final refreshToken = json['refreshToken'] as String;
      await secureStorage.write(key: 'refreshToken', value: refreshToken);
    }
    final userModel = UserModel.fromJson(json);
    final user = userModel.toEntity();
    return user;
  }

  @override
  Future<User> getCurrentUser() async {
    final user = await loginDataSource.getCurrentUser();
    return user;
  }
}
