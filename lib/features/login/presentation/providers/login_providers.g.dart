// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loginDataSource)
const loginDataSourceProvider = LoginDataSourceProvider._();

final class LoginDataSourceProvider
    extends
        $FunctionalProvider<LoginDataSource, LoginDataSource, LoginDataSource>
    with $Provider<LoginDataSource> {
  const LoginDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginDataSourceHash();

  @$internal
  @override
  $ProviderElement<LoginDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginDataSource create(Ref ref) {
    return loginDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginDataSource>(value),
    );
  }
}

String _$loginDataSourceHash() => r'17bd94113292c8cca72158e81d1d10721e20099e';

@ProviderFor(loginRepository)
const loginRepositoryProvider = LoginRepositoryProvider._();

final class LoginRepositoryProvider
    extends
        $FunctionalProvider<LoginRepository, LoginRepository, LoginRepository>
    with $Provider<LoginRepository> {
  const LoginRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginRepositoryHash();

  @$internal
  @override
  $ProviderElement<LoginRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginRepository create(Ref ref) {
    return loginRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginRepository>(value),
    );
  }
}

String _$loginRepositoryHash() => r'f1732af1fdd5951f07b6b9e1fe6d6f01212e5411';

@ProviderFor(loginUsecase)
const loginUsecaseProvider = LoginUsecaseProvider._();

final class LoginUsecaseProvider
    extends $FunctionalProvider<LoginUsecase, LoginUsecase, LoginUsecase>
    with $Provider<LoginUsecase> {
  const LoginUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginUsecaseHash();

  @$internal
  @override
  $ProviderElement<LoginUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginUsecase create(Ref ref) {
    return loginUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginUsecase>(value),
    );
  }
}

String _$loginUsecaseHash() => r'a7112ebb3991b603828956421053e8ea47336842';

@ProviderFor(getCurrentUserUsecase)
const getCurrentUserUsecaseProvider = GetCurrentUserUsecaseProvider._();

final class GetCurrentUserUsecaseProvider
    extends
        $FunctionalProvider<
          GetCurrentUserUsecase,
          GetCurrentUserUsecase,
          GetCurrentUserUsecase
        >
    with $Provider<GetCurrentUserUsecase> {
  const GetCurrentUserUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCurrentUserUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCurrentUserUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetCurrentUserUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCurrentUserUsecase create(Ref ref) {
    return getCurrentUserUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCurrentUserUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCurrentUserUsecase>(value),
    );
  }
}

String _$getCurrentUserUsecaseHash() =>
    r'ec6921797e2e94ee8db912c5e8f0c0a91d30c21d';
