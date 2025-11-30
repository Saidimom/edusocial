import 'package:edu_social/app/theme/app_colors.dart';
import 'package:edu_social/features/posts/domain/entities/post.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final VoidCallback? onTap;
  final VoidCallback? onLike;
  final VoidCallback? onComment;

  const PostCard({super.key, required this.post, this.onTap, this.onLike, this.onComment});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.border, width: 1),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textTertiary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              // Body
              Text(
                post.body,
                style: const TextStyle(fontSize: 14, color: AppColors.textSecondary, height: 1.5),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              // Tags
              if (post.tags != null && post.tags!.isNotEmpty) ...[
                Wrap(
                  spacing: 8,
                  children: post.tags!.take(3).map((tag) {
                    return Chip(
                      label: Text(tag, style: const TextStyle(fontSize: 12)),
                      backgroundColor: AppColors.surface,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
              ],
              // Divider
              const Divider(height: 1),
              const SizedBox(height: 12),
              // Actions row
              Row(
                children: [
                  // Like button
                  _ActionButton(
                    icon: Icons.thumb_up_outlined,
                    label: '${post.reactions.likes}',
                    onTap: onLike,
                  ),
                  const SizedBox(width: 16),
                  // Dislike button
                  _ActionButton(
                    icon: Icons.thumb_down_outlined,
                    label: '${post.reactions.dislikes}',
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  // Comment button
                  _ActionButton(icon: Icons.comment_outlined, label: 'Comment', onTap: onComment),
                  const Spacer(),
                  // Views
                  Row(
                    children: [
                      const Icon(
                        Icons.visibility_outlined,
                        size: 16,
                        color: AppColors.textTertiary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${post.views}',
                        style: const TextStyle(fontSize: 12, color: AppColors.textTertiary),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _ActionButton({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: AppColors.textSecondary),
            const SizedBox(width: 4),
            Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
