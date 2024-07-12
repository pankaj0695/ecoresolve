import 'package:flutter_app/chat/message_card.dart';
import 'package:flutter_app/chat/chat_controller.dart';
import 'package:flutter_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfChatScreenMob extends StatefulWidget {
  const ConfChatScreenMob({super.key});

  @override
  State<ConfChatScreenMob> createState() => _ConfChatScreenMobState();
}

class _ConfChatScreenMobState extends State<ConfChatScreenMob> {
  final _c = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenSizeHeight = screenSize.height;
    final screenSizeWidth = screenSize.width;

    return Center(
        child: Container(
      decoration: const BoxDecoration(
        color: Color(0xFF001120),
      ),
      // backgroundColor:CustomColor.bgLight,
      child: Column(
        children: [
          const SizedBox(height: 15),
          const Text("Conflict Resolution Chat Service",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xffA6FAFF))),
          Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
            height: screenSize.height * 0.8,
            width: screenSize.width * 0.9,
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
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          // Because text field screen is going to update
                          controller: _c.textC,
                          onTapOutside: (e) => FocusScope.of(context).unfocus(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                          cursorColor: const Color(0xffA6FAFF),
                          decoration: InputDecoration(
                            isDense: true,
                            fillColor: const Color.fromRGBO(49, 56, 73, 0.5),
                            filled: true,
                            hintText: "  Ask me anything....",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 12),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 10,
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
                        radius: 16,
                        backgroundColor: CustomColor.greenPrimary,
                        child: IconButton(
                          onPressed: _c.askQuestion,
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 16,
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
