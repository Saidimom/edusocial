import 'package:edu_social/features/posts/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getAllPosts(int? limit, int? skip);

  Future<Post> getPost(int id);
}
