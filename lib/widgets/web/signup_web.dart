import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
// import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:go_router/go_router.dart';

class SignupWeb extends StatefulWidget {
  const SignupWeb({super.key});

  @override
  State<SignupWeb> createState() => _SignupWebState();
}

class _SignupWebState extends State<SignupWeb> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  void _signup() {
    // Navigate to the HomePage
    context.go('/home');
  }

  void _goToLogin() {
    // Navigate to the SignUpWeb page
    context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenSizeHeight = screenSize.height;
    final screenSizeWidth = screenSize.width;

    return Scaffold(
      body: Center(
        child: Container(
          width: screenSizeWidth,
          height: screenSizeHeight,
          decoration: const BoxDecoration(
            color: Color(0xFF001120),
          ),
          child: Row(
            children: [
              // Left Container
              Container(
                width: screenSizeWidth * 0.5,
                color: const Color(0xFF001120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/EcoResolve-logo.png",
                            height: 80),
                        const SizedBox(width: 10),
                        const Text(
                          'EcoResolve',
                          style: TextStyle(
                            fontSize: 60,
                            color: CustomColor.greenPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Discover local volunteering opportunities and resolve disputes with ease using our intelligent chatbots. Our Conflict Resolution Chatbot provides personalized guidance and strategies to address conflicts constructively, empowering you with effective communication tools to foster understanding. Meanwhile, the Community Service Chatbot helps you get involved and make a difference in your community effortlessly, offering tailored suggestions for service projects that match your interests and skills.",
                              style: TextStyle(
                                fontSize: 15,
                                color: CustomColor.lightGrey,
                              ),
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Right Container
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(70),
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 600),
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 23, 42, 0.7),
                        border: Border.all(
                            color: const Color(0xffA6FAFF), width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              "Signup Here!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Color(0xffA6FAFF),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                hintText: 'Enter your Email',
                                hintStyle:
                                    TextStyle(color: CustomColor.lightGrey),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: CustomColor.greenSecondary),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: CustomColor.greenSecondary),
                                ),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                hintText: 'Enter your username',
                                hintStyle:
                                    TextStyle(color: CustomColor.lightGrey),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: CustomColor.greenSecondary),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: CustomColor.greenSecondary),
                                ),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                hintText: 'Create a password',
                                hintStyle:
                                    TextStyle(color: CustomColor.lightGrey),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: CustomColor.greenSecondary),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: CustomColor.greenSecondary),
                                ),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: _signup,
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(46, 196, 216, 0.1),
                                  side: const BorderSide(
                                      color: Color(0xffA6FAFF), width: 1),
                                  minimumSize: const Size(200, 50),
                                  maximumSize: const Size(200, 50)),
                              child: const Text(
                                'Signup',
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xffA6FAFF)),
                              ),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: _goToLogin,
                              child: const Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: CustomColor.lightGrey,
                                  decoration: TextDecoration.underline,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
