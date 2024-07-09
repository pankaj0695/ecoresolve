import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/conflict-resolution.dart';
import 'package:flutter_app/pages/community-service.dart';
import 'package:flutter_app/pages/feedback.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoResolve',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Inika'),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/conflict-resolution': (context) => const ConflictResolutionPage(),
        '/community-service': (context) => const CommunityServicePage(),
        '/feedback': (context) => const FeedbackPage(),
      },
    );
  }
}
