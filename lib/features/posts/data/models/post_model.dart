import 'package:edu_social/features/posts/data/models/reaction_model.dart';
import 'package:edu_social/features/posts/domain/entities/post.dart';
import 'package:edu_social/features/posts/domain/entities/reaction.dart';

class PostModel {
  final int id;
  final String title;
  final String body;
  final List<String>? tags;
  final ReactionModel? reactions;
  final int views;
  final int userId;

  const PostModel({
    required this.id,
    required this.title,
    required this.body,
    this.tags,
    this.reactions,
    required this.views,
    required this.userId,
  });

  factory PostModel.fromEntity(Post entity) {
    return PostModel(
      id: entity.id,
      title: entity.title,
      body: entity.body,
      views: entity.views,
      userId: entity.userId,
      tags: entity.tags,
      reactions: ReactionModel.fromEntity(entity.reactions),
    );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    List<String> tags = [];
    if (json['tags'] != null) {
      List<dynamic> jsonTags = json['tags'];
      tags = jsonTags.map((tag) => tag as String).toList();
    }

    ReactionModel reactions = ReactionModel(likes: 0, dislikes: 0);
    if (json['reactions'] != null) {
      Map<String, dynamic> jsonReactions = json['reactions'];
      reactions.copyWith(
        likes: jsonReactions['likes'] as int,
        dislikes: jsonReactions['dislikes'] as int,
      );
    }

    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      views: json['views'],
      userId: json['userId'],
      tags: tags,
      reactions: reactions,
    );
  }

  Post toEntity() {
    Reaction reaction = Reaction(likes: 0, dislikes: 0);
    if (reactions != null) {
      reaction = reactions!.toEntity();
    }
    return Post(
      id: id,
      title: title,
      body: body,
      reactions: reaction,
      views: views,
      userId: userId,
    );
  }
}
