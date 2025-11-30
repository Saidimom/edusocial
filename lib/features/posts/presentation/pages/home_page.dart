import 'package:edu_social/app/theme/app_colors.dart';
import 'package:edu_social/features/posts/domain/entities/post.dart';
import 'package:edu_social/features/posts/presentation/providers/post_providers.dart';
import 'package:edu_social/features/posts/presentation/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _scrollController = ScrollController();
  List<Post> _posts = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  String? _error;
  int _skip = 0;
  static const int _limit = 10;
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _loadPosts();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent * 0.8) {
      if (!_isLoadingMore && _hasMore) {
        _loadMorePosts();
      }
    }
  }

  Future<void> _loadPosts() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final usecase = ref.read(getAllPostsUsecaseProvider);
      final posts = await usecase.getAllPosts(_limit, 0);

      setState(() {
        _posts = posts;
        _isLoading = false;
        _skip = posts.length;
        _hasMore = posts.length >= _limit;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _loadMorePosts() async {
    if (_isLoadingMore || !_hasMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    try {
      final usecase = ref.read(getAllPostsUsecaseProvider);
      final newPosts = await usecase.getAllPosts(_limit, _skip);

      setState(() {
        if (newPosts.isEmpty) {
          _hasMore = false;
        } else {
          _posts.addAll(newPosts);
          _skip += newPosts.length;
        }
        _isLoadingMore = false;
      });
    } catch (e) {
      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  Future<void> _refreshPosts() async {
    setState(() {
      _skip = 0;
      _hasMore = true;
    });
    await _loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EduSocial'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _refreshPosts, tooltip: 'Refresh'),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading && _posts.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null && _posts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: AppColors.error),
            const SizedBox(height: 16),
            Text('Error loading posts', style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 8),
            Text(
              _error!,
              style: TextStyle(color: AppColors.textTertiary, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _loadPosts, child: const Text('Retry')),
          ],
        ),
      );
    }

    if (_posts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.article_outlined, size: 64, color: AppColors.textTertiary),
            const SizedBox(height: 16),
            Text('No posts yet', style: TextStyle(color: AppColors.textSecondary)),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: _refreshPosts, child: const Text('Refresh')),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _refreshPosts,
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: _posts.length + (_isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= _posts.length) {
            return const Center(
              child: Padding(padding: EdgeInsets.all(16.0), child: CircularProgressIndicator()),
            );
          }

          final post = _posts[index];
          return PostCard(
            post: post,
            onTap: () {
              context.push('/posts/${post.id}');
            },
            onLike: () {
              // TODO: Handle like
            },
            onComment: () {
              // TODO: Handle comment
            },
          );
        },
      ),
    );
  }
}
