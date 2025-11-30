import 'package:edu_social/features/posts/domain/entities/reaction.dart';

class ReactionModel {
  final int likes;
  final int dislikes;

  const ReactionModel({required this.likes, required this.dislikes});

  factory ReactionModel.fromJson(Map<String, dynamic> json) {
    return ReactionModel(likes: json['likes'], dislikes: json['dislikes']);
  }

  factory ReactionModel.fromEntity(Reaction entity) {
    return ReactionModel(likes: entity.likes, dislikes: entity.dislikes);
  }

  Reaction toEntity() => Reaction(likes: likes, dislikes: dislikes);

  ReactionModel copyWith({int? likes, int? dislikes}) {
    return ReactionModel(likes: likes ?? this.likes, dislikes: dislikes ?? this.dislikes);
  }
}
