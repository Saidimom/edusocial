import 'package:edu_social/features/posts/data/datasources/post_data_source.dart';
import 'package:edu_social/features/posts/domain/entities/post.dart';
import 'package:edu_social/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  final PostDataSource postDataSource;

  PostRepositoryImpl({required this.postDataSource});

  @override
  Future<List<Post>> getAllPosts(int? limit, int? skip) async {
    final posts = await postDataSource.getAllPosts(limit, skip);
    return posts.map((post) => post.toEntity()).toList();
  }

  @override
  Future<Post> getPost(int id) async {
    final post = await postDataSource.getPost(id);
    return post.toEntity();
  }
}
