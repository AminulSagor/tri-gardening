import 'package:get/get.dart';

class MessageController extends GetxController {
  final messages = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadInitialMessages();
  }

  void loadInitialMessages() {
    messages.assignAll([
      {"sender": "Alice", "text": "Hi there!", "time": "10:00 AM"},
      {"sender": "Bob", "text": "Hello! How can I help you?", "time": "10:02 AM"},
      {"sender": "Alice", "text": "I want to know about your plant care kits.", "time": "10:05 AM"},
      {"sender": "Bob", "text": "Sure! We have organic and budget-friendly options.", "time": "10:07 AM"},
    ]);
  }

  void sendMessage(String text) {
    messages.add({
      "sender": "Alice",
      "text": text,
      "time": getCurrentTime(),
    });
  }

  String getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')}";
  }
}
