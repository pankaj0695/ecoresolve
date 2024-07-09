import 'package:flutter/material.dart';
import 'package:flutter_app/components/navbar.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Help Us Improve Your Experience',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan),
            ),
            const SizedBox(height: 20),
            FeedbackForm(),
          ],
        ),
      ),
    );
  }
}

class FeedbackForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FeedbackQuestion(
          question:
              'How would you rate your overall experience with our website?',
          options: const ['Excellent', 'Good', 'Poor'],
        ),
        FeedbackQuestion(
          question:
              'How effective do you find our conflict resolution tools and advice?',
          options: const ['Effective', 'Neutral', 'Ineffective'],
        ),
        FeedbackQuestion(
          question:
              'How would you rate the quality of the information provided on our website?',
          options: const ['Excellent', 'Good', 'Poor'],
        ),
        FeedbackQuestion(
          question:
              'How effective do you find our community service and social responsibility initiatives?',
          options: const ['Effective', 'Neutral', 'Ineffective'],
        ),
        FeedbackTextInput(
          question:
              'What suggestions do you have for improving our website and services?',
        ),
        FeedbackTextInput(
          question:
              'Do you have any additional comments or feedback you would like to share?',
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan,
          ),
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

class FeedbackQuestion extends StatelessWidget {
  final String question;
  final List<String> options;

  FeedbackQuestion({required this.question, required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '✦ $question',
          style: const TextStyle(fontSize: 18, color: Colors.cyan),
        ),
        for (var option in options)
          Row(
            children: [
              Radio(
                value: option,
                groupValue: null,
                onChanged: (value) {},
              ),
              Text(
                option,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        const SizedBox(height: 10),
      ],
    );
  }
}

class FeedbackTextInput extends StatelessWidget {
  final String question;

  FeedbackTextInput({required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '✦ $question',
          style: const TextStyle(fontSize: 18, color: Colors.cyan),
        ),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
