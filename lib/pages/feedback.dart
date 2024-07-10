import 'package:flutter/material.dart';
import 'package:flutter_app/components/feedback-form.dart';
import 'package:flutter_app/components/navbar.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFF001120),
        appBar: Navbar(),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Help Us Improve Your Experience',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffA6FAFF)),
                ),
                SizedBox(height: 20),
                FeedbackForm(),
              ],
            ),
          ),
        ));
  }
}
