import 'package:flutter/material.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/signup_page.dart';

class LoginMob extends StatefulWidget {
  const LoginMob({super.key});

  @override
  State<LoginMob> createState() => _LoginMobState();
}

class _LoginMobState extends State<LoginMob> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Navigate to the HomePage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  void _goToSignup() {
    // Navigate to the SignUpWeb page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupPage()),
    );
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
          child: Column( 
            children: [
              Padding(
                padding: const EdgeInsets.only(top:40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/EcoResolve-logo.png", height: 40),
                    const SizedBox(width: 10),
                    const Text(
                                'EcoResolve',
                                style: TextStyle(
                                  fontSize: 45,
                                  color: CustomColor.greenPrimary,
                                  fontWeight: FontWeight.bold,
                            ),
                          ),
                  ],
                ),
              ),
              Expanded(
              child: Container(
                
                padding: const EdgeInsets.all(70),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 23, 42, 0.7),
                      border: Border.all(color: const Color(0xffA6FAFF), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
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
                              borderSide: BorderSide(color: CustomColor.greenSecondary),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: CustomColor.greenSecondary),
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
                              borderSide: BorderSide(color: CustomColor.greenSecondary),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: CustomColor.greenSecondary),
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
                                fontSize: 20, color: Color(0xffA6FAFF)),),
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
