import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter_app/comchat/com_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ComchatController extends GetxController {
  final textC = TextEditingController();

  final scrollC = ScrollController();

  final list = <ComMessage>[
    ComMessage(
        commsg: 'Hello! How can I assist you today?',
        comMsgType: ComMessageType.bot2),
  ].obs;

  /*
  Future<void> askQuestion() async {
    final question = textC.text;
    if (question.trim().isNotEmpty) {
      //user
      list.add(ComMessage(commsg: question, comMsgType: ComMessageType.user2));
      textC.text = '';

      list.add(
          ComMessage(commsg: 'Please Wait!', comMsgType: ComMessageType.bot2));
      _scrollDown();

      try {
        var headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer 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'
        };
        var request = http.Request(
            'POST',
            Uri.parse(
                'https://api-inference.huggingface.co/models/Moodyspider266/EnviroBot-Llama-3-8B'));
        request.body = json.encode({
          "text":
              "<|begin_of_text|><|start_header_id|>system<|end_header_id|>You are a knowledgeable assistant that provides helpful answers to questions about conservation and environmental protection.<|eot_id|> <|start_header_id|>user<|end_header_id|>Could you give me ideas to organize a friendly recycling competition at school?<|eot_id|><|start_header_id|>assistant<|end_header_id|><|eot_id|>"
        });
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();
        print(response.statusCode);
        if (response.statusCode == 200) {
          var data = await response.stream.bytesToString();
          var answer = data;
          list.removeLast();
          list.add(ComMessage(commsg: answer, comMsgType: ComMessageType.bot2));
          _scrollDown();
        } else {
          list.removeLast();
          list.add(ComMessage(
              commsg: 'Something went wrong', comMsgType: ComMessageType.bot2));
          _scrollDown();
        }
      } catch (e) {
        print('Error occurred: $e');
      }
    }
  }*/

  Future<void> askQuestion() async {
    final question = textC.text;
    if (question.trim().isNotEmpty) {
      //user
      list.add(ComMessage(commsg: question, comMsgType: ComMessageType.user2));
      textC.text = '';

      list.add(
          ComMessage(commsg: 'Please Wait!', comMsgType: ComMessageType.bot2));
      _scrollDown();

      try {
        var response = await http.post(
          Uri.parse(foundation.kIsWeb ||
                  foundation.defaultTargetPlatform == TargetPlatform.iOS
              ? 'https://1016-35-199-175-20.ngrok-free.app/api/chat/' // Use localhost for web
              : 'http://10.0.2.2:8000/api/chat/'), // Use Android emulator address for mobile
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'question': question}),
        );

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          var answer = data['response'];
          list.removeLast();
          list.add(ComMessage(commsg: answer, comMsgType: ComMessageType.bot2));
          _scrollDown();
        } else {
          list.removeLast();
          list.add(ComMessage(
              commsg: 'Something went wrong', comMsgType: ComMessageType.bot2));
          _scrollDown();
        }
      } catch (e) {
        print('Error occurred: $e');
      }
    }
  }

  // for moving to the end of the screen after texts increases
  void _scrollDown() {
    scrollC.animateTo(scrollC.position.maxScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
