import 'package:edu_social/features/posts/domain/entities/post.dart';
import 'package:edu_social/features/posts/domain/repositories/post_repository.dart';

class GetPostUsecase {
  final PostRepository repository;
  GetPostUsecase(this.repository);

  Future<Post> call(int id) {
    return repository.getPost(id);
  }
}
