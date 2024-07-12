import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/constants/nav_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/conflict-resolution.dart';
import 'package:flutter_app/pages/community-service.dart';
import 'package:flutter_app/pages/feedback.dart';

class DrawerMob extends StatelessWidget {
  const DrawerMob({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 0, 34, 61),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 20, bottom: 20),
              child: IconButton(
                  color: const Color(0xffA6FAFF),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close)),
            ),
          ),
          for (int i = 0; i < navIcons.length; i++)
            ListTile(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) {
                      return _getPageByRouteName(navPaths[i]);
                    },
                    transitionDuration: const Duration(seconds: 0),
                  ),
                  (route) => false,
                );
              },
              iconColor: const Color(0xffA6FAFF),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              leading: Icon(navIcons[i]),
              title: Text(navTitles[i]),
              titleTextStyle: const TextStyle(
                color: CustomColor.lightGrey,
                fontSize: 15,
              ),
            ),
        ],
      ),
    );
  }

  Widget _getPageByRouteName(String routeName) {
    switch (routeName) {
      case '/':
        return const HomePage();
      case '/conflict-resolution':
        return const ConflictResolutionPage();
      case '/community-service':
        return const CommunityServicePage();
      case '/feedback':
        return const FeedbackPage();
      default:
        return const HomePage();
    }
  }
}
