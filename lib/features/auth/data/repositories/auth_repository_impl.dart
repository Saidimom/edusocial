import 'package:edu_social/features/auth/data/datasources/auth_data_source.dart';
import 'package:edu_social/features/auth/domain/repositories/auth_repository.dart';
import 'package:edu_social/features/shared/data/models/user_model.dart';
import 'package:edu_social/features/shared/domain/entities/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource authDataSource;
  final FlutterSecureStorage secureStorage;

  AuthRepositoryImpl({required this.authDataSource, FlutterSecureStorage? secureStorage})
    : secureStorage = secureStorage ?? const FlutterSecureStorage();

  @override
  Future<User> getCurrentUser() async {
    final user = await authDataSource.getCurrentUser();
    return user;
  }

  @override
  Future<User> login(String username, String password) async {
    final json = await authDataSource.login(username, password);
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
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
