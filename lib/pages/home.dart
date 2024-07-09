import 'package:flutter/material.dart';
import 'package:flutter_app/components/Section.dart';
import 'package:flutter_app/components/nav-button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF001120),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: AppBar(
              shape: const Border(
                  bottom: BorderSide(color: Color(0xffD0D0D0), width: 1)),
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
                NavButton(text: 'Home', onPressed: () {}),
                NavButton(text: 'Conflict Resolution', onPressed: () {}),
                NavButton(text: 'Community Service', onPressed: () {}),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: NavButton(text: 'Feedback', onPressed: () {})),
              ],
            )),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Section(
                title: 'Welcome to Our Conflict Resolution Hub',
                description:
                    'At our Conflict Resolution Hub, we believe that every conflict holds an opportunity for growth and understanding. Our mission is to provide you with the tools and resources you need to navigate and resolve conflicts effectively. Whether you’re dealing with interpersonal issues, workplace disagreements, or community disputes, our platform offers comprehensive guides, expert advice, and practical strategies to help you achieve peaceful resolutions.',
                buttonText: 'Conflict Resolution',
                onPressed: () {},
                imagePath: 'assets/images/community-image.png',
              ),
              const SizedBox(height: 40),
              Section(
                  title:
                      'Welcome to Our Community Service and Social Responsibility Platform',
                  description:
                      'We are dedicated to promoting social responsibility and community engagement. Our platform connects volunteers, organizations, and community members who share a passion for making a positive impact. Together, we can create meaningful change and build a stronger, more compassionate community.',
                  buttonText: 'Community Service',
                  onPressed: () {},
                  imagePath: 'assets/images/community-image.png',
                  isImageFirst: true),
            ],
          ),
        ));
  }
}
