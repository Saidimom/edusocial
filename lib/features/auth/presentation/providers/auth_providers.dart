import 'package:edu_social/core/network/api_client.dart';
import 'package:edu_social/features/auth/data/datasources/auth_data_source.dart';
import 'package:edu_social/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:edu_social/features/auth/domain/repositories/auth_repository.dart';
import 'package:edu_social/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:edu_social/features/auth/domain/usecases/login_usecase.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@riverpod
AuthDataSource authDataSource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthDataSource(apiClient.dio);
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(authDataSource: ref.watch(authDataSourceProvider));
}

@riverpod
LoginUsecase loginUsecase(Ref ref) {
  return LoginUsecase(ref.watch(authRepositoryProvider));
}

@riverpod
GetCurrentUserUsecase getCurrentUserUsecase(Ref ref) {
  return GetCurrentUserUsecase(ref.watch(authRepositoryProvider));
}
