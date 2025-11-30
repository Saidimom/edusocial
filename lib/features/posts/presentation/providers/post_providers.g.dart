// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(postDataSource)
const postDataSourceProvider = PostDataSourceProvider._();

final class PostDataSourceProvider
    extends $FunctionalProvider<PostDataSource, PostDataSource, PostDataSource>
    with $Provider<PostDataSource> {
  const PostDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postDataSourceHash();

  @$internal
  @override
  $ProviderElement<PostDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostDataSource create(Ref ref) {
    return postDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostDataSource>(value),
    );
  }
}

String _$postDataSourceHash() => r'a28658f8eb585d8e56e9670a6c0d491a16e845b2';

@ProviderFor(postRepository)
const postRepositoryProvider = PostRepositoryProvider._();

final class PostRepositoryProvider
    extends $FunctionalProvider<PostRepository, PostRepository, PostRepository>
    with $Provider<PostRepository> {
  const PostRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postRepositoryHash();

  @$internal
  @override
  $ProviderElement<PostRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PostRepository create(Ref ref) {
    return postRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PostRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PostRepository>(value),
    );
  }
}

String _$postRepositoryHash() => r'f0cdbff0afd7c62f263970ec0e388252cb1292e5';

@ProviderFor(getAllPostsUsecase)
const getAllPostsUsecaseProvider = GetAllPostsUsecaseProvider._();

final class GetAllPostsUsecaseProvider
    extends
        $FunctionalProvider<
          GetAllPostsUsecase,
          GetAllPostsUsecase,
          GetAllPostsUsecase
        >
    with $Provider<GetAllPostsUsecase> {
  const GetAllPostsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAllPostsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAllPostsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetAllPostsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetAllPostsUsecase create(Ref ref) {
    return getAllPostsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetAllPostsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetAllPostsUsecase>(value),
    );
  }
}

String _$getAllPostsUsecaseHash() =>
    r'a3ece7310907222187bc3ecb4a15a06fe64322ce';

@ProviderFor(getPostUsecase)
const getPostUsecaseProvider = GetPostUsecaseProvider._();

final class GetPostUsecaseProvider
    extends $FunctionalProvider<GetPostUsecase, GetPostUsecase, GetPostUsecase>
    with $Provider<GetPostUsecase> {
  const GetPostUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPostUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPostUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetPostUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetPostUsecase create(Ref ref) {
    return getPostUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPostUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPostUsecase>(value),
    );
  }
}

String _$getPostUsecaseHash() => r'5f6b1e569587379a552d75735291a79f831f04f0';
