import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/conflict-resolution.dart';
import 'package:flutter_app/pages/community-service.dart';
import 'package:flutter_app/pages/feedback.dart';

class NavButton extends StatefulWidget {
  final String text;
  final String routeName;

  NavButton({required this.text, required this.routeName});

  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) {
                    return _getPageByRouteName(widget.routeName);
                  },
                  transitionDuration: const Duration(seconds: 0),
                ),
                (route) => false,
              );
            },
            child: Text(
              widget.text,
              style: TextStyle(
                  color: _isHovering
                      ? const Color(0xffA6FAFF)
                      : const Color(0xffC3C3C3),
                  fontSize: 17),
            ),
          ),
        ));
  }

  void _onHover(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }

  Widget _getPageByRouteName(String routeName) {
    switch (routeName) {
      case '/':
        return const HomePage();
      case '/conflict-resolution':
        return ConflictResolutionPage();
      case '/community-service':
        return CommunityServicePage();
      case '/feedback':
        return FeedbackPage();
      default:
        return const HomePage();
    }
  }
}
