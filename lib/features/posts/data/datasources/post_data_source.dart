import 'package:dio/dio.dart';
import 'package:edu_social/features/posts/data/models/post_model.dart';

class PostDataSource {
  final Dio dio;
  PostDataSource(this.dio);

  Future<List<PostModel>> getAllPosts(int? limit, int? skip) async {
    limit ??= 10;
    skip ??= 0;

    final res = await dio.get('/posts', queryParameters: {'limit': limit, 'skip': skip});

    final List<dynamic> posts = res.data['posts'];
    return posts.map((json) => PostModel.fromJson(json as Map<String, dynamic>)).toList();
  }

  Future<PostModel> getPost(int id) async {
    final res = await dio.get('/posts/$id');
    final json = res.data as Map<String, dynamic>;
    return PostModel.fromJson(json);
  }
}
