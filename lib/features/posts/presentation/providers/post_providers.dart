import 'package:edu_social/core/network/api_client.dart';
import 'package:edu_social/features/posts/data/datasources/post_data_source.dart';
import 'package:edu_social/features/posts/data/repositories/post_repository_impl.dart';
import 'package:edu_social/features/posts/domain/repositories/post_repository.dart';
import 'package:edu_social/features/posts/domain/usecases/get_all_posts_usecase.dart';
import 'package:edu_social/features/posts/domain/usecases/get_post_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_providers.g.dart';

@riverpod
PostDataSource postDataSource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return PostDataSource(apiClient.dio);
}

@riverpod
PostRepository postRepository(Ref ref) {
  return PostRepositoryImpl(postDataSource: ref.watch(postDataSourceProvider));
}

@riverpod
GetAllPostsUsecase getAllPostsUsecase(Ref ref) {
  return GetAllPostsUsecase(ref.watch(postRepositoryProvider));
}

@riverpod
GetPostUsecase getPostUsecase(Ref ref) {
  return GetPostUsecase(ref.watch(postRepositoryProvider));
}
