import 'package:edu_social/app/pages/welcome_page.dart';
import 'package:edu_social/app/router/app_router.dart';
import 'package:edu_social/features/login/presentation/pages/login_page.dart';
import 'package:edu_social/features/registration/presentation/pages/registration_flow.dart';
import 'package:edu_social/app/pages/splash_page.dart';
import 'package:edu_social/features/posts/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
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
      path: AppRoutes.welcome,
      name: AppRoutes.welcomeName,
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: AppRoutes.login,
      name: AppRoutes.loginName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.registration,
      name: AppRoutes.registrationName,
      builder: (context, state) => const RegistrationFlow(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            onTap: (value) {
              navigationShell.goBranch(value);
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Posts'),
              BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Listings'),
              BottomNavigationBarItem(icon: Icon(Icons.agriculture), label: 'MyFarm'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        );
      },

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/posts', name: 'posts', builder: (context, state) => const HomePage()),
          ],
        ),
      ],
    ),
  ],
);
