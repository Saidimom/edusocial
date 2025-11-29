import 'package:edu_social/core/network/api_client.dart';
import 'package:edu_social/features/login/data/datasources/login_data_source.dart';
import 'package:edu_social/features/login/data/repositories/login_repository_impl.dart';
import 'package:edu_social/features/login/domain/repositories/login_repository.dart';
import 'package:edu_social/features/login/domain/usecases/get_current_user_usecase.dart';
import 'package:edu_social/features/login/domain/usecases/login_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_providers.g.dart';

@riverpod
LoginDataSource loginDataSource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return LoginDataSource(apiClient.dio);
}

@riverpod
LoginRepository loginRepository(Ref ref) {
  return LoginRepositoryImpl(loginDataSource: ref.watch(loginDataSourceProvider));
}

@riverpod
LoginUsecase loginUsecase(Ref ref) {
  return LoginUsecase(ref.watch(loginRepositoryProvider));
}

@riverpod
GetCurrentUserUsecase getCurrentUserUsecase(Ref ref) {
  return GetCurrentUserUsecase(ref.watch(loginRepositoryProvider));
}
