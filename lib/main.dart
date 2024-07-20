import 'package:flutter/material.dart';
import 'package:flutter_app/pages/community-service.dart';
import 'package:flutter_app/pages/conflict-resolution.dart';
import 'package:flutter_app/pages/feedback.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/signup_page.dart'; 
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SignupPage()), 
            // const NoTransitionPage(child: SignupPage()),
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: HomePage()),
            // const NoTransitionPage(child: SignupPage()),
      ),
      GoRoute(
        path: '/conflict-resolution',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: ConflictResolutionPage()),
            // const NoTransitionPage(child: LoginPage()),
      ),
      GoRoute( 
        path: '/community-service',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: CommunityServicePage()),
      ),
      GoRoute(
        path: '/feedback',
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: FeedbackPage()),
      ),
    ],
  );

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'EcoResolve',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Inika'),
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider);
  }
}
