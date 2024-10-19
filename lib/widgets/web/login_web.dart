import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:go_router/go_router.dart';

class LoginWeb extends StatefulWidget {
  const LoginWeb({super.key});

  @override
  State<LoginWeb> createState() => _LoginWebState();
}

class _LoginWebState extends State<LoginWeb> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    context.go('/home');
  }

  void _goToSignup() {
    context.go('/signup');
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
                  color: const Color(
                      0xFF001120), // Replace this with CustomColor.scaffoldBg if defined
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/EcoResolve-logo.png",
                              height: 80),
                          const SizedBox(width: 10),
                          const Text('EcoResolve',
                              style: TextStyle(
                                  fontSize: 60,
                                  color: CustomColor.greenPrimary,
                                  fontWeight: FontWeight.bold))
                        ],
                      )),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: const Row(
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
                  )),
              // Right Container
              Container(
                width: screenSizeWidth * 0.5,
                padding: const EdgeInsets.all(70),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 23, 42, 0.7),
                      border:
                          Border.all(color: const Color(0xffA6FAFF), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Login Here!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color(0xffA6FAFF),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your Email here',
                            hintStyle: TextStyle(color: CustomColor.lightGrey),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColor.greenSecondary),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColor.greenSecondary),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Enter your password',
                            hintStyle: TextStyle(color: CustomColor.lightGrey),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColor.greenSecondary),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: CustomColor.greenSecondary),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 35),
                        ElevatedButton(
                          onPressed: _login,
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
                            'Login',
                            style: TextStyle(
                                fontSize: 20, color: Color(0xffA6FAFF)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: _goToSignup,
                          child: const Text(
                            "Create an account?",
                            style: TextStyle(
                              color: CustomColor.lightGrey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
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
