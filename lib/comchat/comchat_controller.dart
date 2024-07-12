import 'package:flutter_app/comapis/com_apis.dart';
import 'package:flutter_app/comchat/com_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComchatController extends GetxController {
  final textC = TextEditingController();

  final scrollC = ScrollController();

  final list = <ComMessage>[
    ComMessage(
        commsg: 'Hello! How can I assist you today?',
        comMsgType: ComMessageType.bot2)
  ].obs;

  Future<void> askQuestion() async {
    if (textC.text.trim().isNotEmpty) {
      //user
      list.add(
          ComMessage(commsg: textC.text, comMsgType: ComMessageType.user2));
      list.add(ComMessage(
          commsg: 'something went wrong', comMsgType: ComMessageType.bot2));
      _scrollDown();

      final res = await APIs2.getAnswer(textC.text);

      //bot
      list.removeLast();
      list.add(ComMessage(commsg: res, comMsgType: ComMessageType.bot2));
      _scrollDown();

      textC.text = '';
    }
  }

  // for moving to the end of the screen after texts increases
  void _scrollDown() {
    scrollC.animateTo(scrollC.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
