import 'package:flutter/material.dart';
import 'package:flutter_app/components/nav-button.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape:
          const Border(bottom: BorderSide(color: Color(0xffD0D0D0), width: 1)),
      centerTitle: false,
      backgroundColor: const Color(0xFF001120),
      title: Container(
          margin: const EdgeInsets.fromLTRB(20, 15, 15, 0),
          child: Row(children: [
            Image.asset(
              "assets/images/EcoResolve-logo.png",
              height: 40,
            ),
            const SizedBox(width: 8),
            const Text(
              'EcoResolve',
              style: TextStyle(
                  fontSize: 25,
                  color: Color(0xff2EC4D8),
                  fontWeight: FontWeight.w700),
            )
          ])),
      actions: [
        NavButton(text: 'Home', routeName: '/'),
        NavButton(
            text: 'Conflict Resolution', routeName: '/conflict-resolution'),
        NavButton(text: 'Community Service', routeName: '/community-service'),
        Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: NavButton(text: 'Feedback', routeName: '/feedback')),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
