import 'package:edu_social/features/posts/domain/entities/reaction.dart';

class Post {
  final int id;
  final String title;
  final String body;
  final List<String>? tags;
  final Reaction reactions;
  final int views;
  final int userId;

  const Post({
    required this.id,
    required this.title,
    required this.body,
    this.tags,
    required this.reactions,
    required this.views,
    required this.userId,
  });
}
