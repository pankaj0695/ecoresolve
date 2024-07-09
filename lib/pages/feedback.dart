import 'package:flutter/material.dart';
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

class FeedbackForm extends StatelessWidget {
  const FeedbackForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0, 23, 42, 0.7),
          border: Border.all(color: const Color(0xffA6FAFF), width: 1),
          borderRadius: BorderRadius.circular(30),
        ),
        width: 800,
        child: Column(
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(color: Color(0xffA6FAFF), width: 1),
                backgroundColor: const Color.fromRGBO(46, 196, 216, 0.2),
              ),
              child: const Padding(
                  padding: EdgeInsets.fromLTRB(18, 8, 18, 8),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20, color: Color(0xffA6FAFF)),
                  )),
            ),
          ],
        ));
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
          style: const TextStyle(fontSize: 20, color: Color(0xff2EC4D8)),
        ),
        Row(
          children: [
            for (var option in options)
              Row(
                children: [
                  const SizedBox(width: 20),
                  Radio(
                    value: option,
                    groupValue: null,
                    onChanged: (value) {},
                  ),
                  Text(
                    option,
                    style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  const SizedBox(width: 60)
                ],
              )
          ],
        ),
        const SizedBox(height: 20),
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
          style: const TextStyle(fontSize: 20, color: Color(0xff2EC4D8)),
        ),
        const SizedBox(height: 5),
        const TextField(
          style: TextStyle(color: Colors.white),
          cursorColor: Color(0xffA6FAFF),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffA6FAFF), width: 0.5)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffA6FAFF), width: 0.5)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffA6FAFF), width: 1)),
              fillColor: Color.fromRGBO(49, 56, 73, 0.5),
              filled: true),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
