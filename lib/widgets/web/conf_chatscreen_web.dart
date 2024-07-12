import 'package:flutter_app/chat/message_card.dart';
import 'package:flutter_app/chat/chat_controller.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfChatScreenWeb extends StatefulWidget {
  const ConfChatScreenWeb({super.key});

  @override
  State<ConfChatScreenWeb> createState() => _ConfChatScreenWebState();
}

class _ConfChatScreenWebState extends State<ConfChatScreenWeb> {
  final _c = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenSizeHeight = screenSize.height;
    final screenSizeWidth = screenSize.width;
    final isDesktop = screenSizeWidth >= 600;

    return Center(
        child: Container(
      decoration: const BoxDecoration(
        color: Color(0xFF001120),
      ),
      // backgroundColor:CustomColor.bgLight,
      child: Column(
        children: [
          const SizedBox(height: 15),
          Text("Conflict Resolution Chat Service",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isDesktop ? 30 : 20,
                  color: const Color(0xffA6FAFF))),
          Container(
            margin:
                const EdgeInsets.only(left: 80, right: 80, bottom: 50, top: 20),
            height: screenSize.height * 0.8,
            width: screenSize.width * 0.7,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 23, 42, 0.7),
              border: Border.all(color: const Color(0xffA6FAFF), width: 2),
              borderRadius: BorderRadius.circular(
                  20), // Adjust the value for more or less curvature
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  20), // Same border radius as the container
              child: Scaffold(
                backgroundColor: const Color.fromRGBO(
                    0, 23, 42, 0.7), // Set scaffold background to transparent

                //send message field and button
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: Padding(
                  padding: EdgeInsets.all(isDesktop ? 10.0 : 5.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          // Because text field screen is going to update
                          controller: _c.textC,
                          onTapOutside: (e) => FocusScope.of(context).unfocus(),
                          style: const TextStyle(color: Colors.white),
                          cursorColor: const Color(0xffA6FAFF),
                          decoration: InputDecoration(
                            isDense: true,
                            fillColor: const Color.fromRGBO(49, 56, 73, 0.5),
                            filled: true,
                            hintText: "  Ask me anything....",
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: isDesktop ? 13 : 7),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: isDesktop ? 16 : 8,
                              horizontal: isDesktop ? 20 : 8,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color: CustomColor.greenSecondary, width: 1),
                              // Set your border color here
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(
                                  color: CustomColor.greenSecondary, width: 2),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 9),
                      CircleAvatar(
                        radius: isDesktop ? 25 : 15,
                        backgroundColor: CustomColor.greenPrimary,
                        child: IconButton(
                          onPressed: _c.askQuestion,
                          icon: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: isDesktop ? 25 : 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                body: Obx(
                  () => ListView(
                    physics: const BouncingScrollPhysics(),
                    controller: _c.scrollC,
                    padding: EdgeInsets.only(
                        top: screenSizeHeight * .02,
                        bottom: screenSizeWidth * .02),
                    children:
                        _c.list.map((e) => MessageCard(message: e)).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
