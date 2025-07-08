import 'package:get/get.dart';

class ChatController extends GetxController {
  final messages = <Map<String, String>>[].obs;
  final messageController = ''.obs;

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    messages.add({"role": "user", "text": text});
    messageController.value = '';

    // Simulate a reply
    Future.delayed(const Duration(milliseconds: 500), () {
      messages.add({"role": "bot", "text": _getBotReply(text)});
    });
  }

  String _getBotReply(String userText) {
    if (userText.toLowerCase().contains("product")) {
      return "Sure, please go ahead.";
    }
    return "Thank you for your message. We'll get back to you shortly.";
  }
}
