import 'package:dio/dio.dart';
import 'package:edu_social/features/shared/data/models/user_model.dart';
import 'package:edu_social/features/shared/domain/entities/user.dart';

class AuthDataSource {
  final Dio dio;
  AuthDataSource(this.dio);

  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await dio.post(
      '/auth/login',
      data: {'username': username, 'password': password, 'expiresInMins': 30},
    );
    return response.data as Map<String, dynamic>;
  }

  Future<User> getCurrentUser() async {
    final response = await dio.get('/auth/me');

    final userModel = UserModel.fromJson(response.data);
    final user = userModel.toEntity();
    return user;
  }
}
