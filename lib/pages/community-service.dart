import 'package:flutter/material.dart';
import 'package:flutter_app/components/navbar.dart';

class CommunityServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(),
      body: Center(child: Text('Community Service Page')),
    );
  }
}
