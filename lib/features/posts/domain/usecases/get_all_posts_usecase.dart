import 'package:edu_social/features/posts/domain/entities/post.dart';
import 'package:edu_social/features/posts/domain/repositories/post_repository.dart';

class GetAllPostsUsecase {
  final PostRepository repository;
  GetAllPostsUsecase(this.repository);

  Future<List<Post>> getAllPosts(int? limit, int? skip) {
    return repository.getAllPosts(limit, skip);
  }
}
