import 'package:go_router/go_router.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String registration = '/registration';
  static const String home = '/home';

  static const String splashName = 'splash';
  static const String loginName = 'login';
  static const String registrationName = 'registration';
  static const String homeName = 'home';
}

extension AppRouterExtension on GoRouter {
  void pushSplash() => push(AppRoutes.splash);
  void pushRegistration() => push(AppRoutes.registration);
  void pushHome() => push(AppRoutes.home);
  void pushLogin() => push(AppRoutes.login);

  void goToSplash() => go(AppRoutes.splash);
  void goToRegistration() => go(AppRoutes.registration);
  void goToHome() => go(AppRoutes.home);
  void goToLogin() => go(AppRoutes.login);
}
