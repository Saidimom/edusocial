import 'package:edu_social/app/router/app_router.dart';
import 'package:edu_social/features/registration/presentation/pages/registration_flow.dart';
import 'package:edu_social/app/pages/splash_page.dart';
import 'package:edu_social/features/posts/presentation/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      name: AppRoutes.splashName,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: AppRoutes.registration,
      name: AppRoutes.registrationName,
      builder: (context, state) => const RegistrationFlow(),
    ),
    GoRoute(
      path: AppRoutes.home,
      name: AppRoutes.homeName,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
