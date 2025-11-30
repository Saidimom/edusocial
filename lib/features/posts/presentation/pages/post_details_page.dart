import 'package:edu_social/app/theme/app_colors.dart';
import 'package:edu_social/features/posts/domain/entities/post.dart';
import 'package:edu_social/features/posts/presentation/providers/post_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailsPage extends ConsumerStatefulWidget {
  final int postId;

  const PostDetailsPage({super.key, required this.postId});

  @override
  ConsumerState<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends ConsumerState<PostDetailsPage> {
  Post? _post;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadPost();
  }

  Future<void> _loadPost() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final usecase = ref.read(getPostUsecaseProvider);
      final post = await usecase.call(widget.postId);
      if (mounted) {
        setState(() {
          _post = post;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Details')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: AppColors.error),
            const SizedBox(height: 16),
            Text('Error loading post', style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                _error!,
                style: TextStyle(color: AppColors.textTertiary, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }

    if (_post == null) {
      return const Center(child: Text('Post not found'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _post!.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _post!.body,
            style: const TextStyle(fontSize: 16, color: AppColors.textSecondary, height: 1.6),
          ),
          const SizedBox(height: 24),
          if (_post!.tags != null && _post!.tags!.isNotEmpty) ...[
            Wrap(
              spacing: 0,
              runSpacing: 8,
              children: _post!.tags!.map((tag) {
                return Chip(label: Text(tag), backgroundColor: AppColors.surfaceVariant);
              }).toList(),
            ),
            const SizedBox(height: 24),
          ],
          const Divider(),
          const SizedBox(height: 16),
          Row(
            children: [
              // Likes
              _StatItem(
                icon: Icons.thumb_up_outlined,
                label: 'Likes',
                value: '${_post!.reactions.likes}',
              ),
              const SizedBox(width: 24),
              // Dislikes
              _StatItem(
                icon: Icons.thumb_down_outlined,
                label: 'Dislikes',
                value: '${_post!.reactions.dislikes}',
              ),
              const SizedBox(width: 24),
              // Views
              _StatItem(icon: Icons.visibility_outlined, label: 'Views', value: '${_post!.views}'),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatItem({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.textSecondary),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textTertiary)),
      ],
    );
  }
}
