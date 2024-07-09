import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  NavButton({required this.text, required this.onPressed});

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
            onPressed: widget.onPressed,
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
}
