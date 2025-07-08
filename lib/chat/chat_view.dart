import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_view.dart';
import 'chat_controller.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatController());
    final textController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
          ),
          child: Column(
            children: [
              // Header
              Row(
                children: [
                  const Icon(Icons.eco, color: Colors.green),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text("Tri Gardening", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                  ),
                  ElevatedButton(
                    onPressed: () => Get.offAll(() => const HomeView()),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text("Back to Home"),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(color: const Color(0xFF0E4B36), borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: const [
                    Icon(Icons.chat_bubble_outline, color: Colors.white),
                    SizedBox(width: 8),
                    Text("Live Chat", style: TextStyle(color: Colors.white, fontSize: 16)),
                    Spacer(),
                    Icon(Icons.close, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Chat Messages
              Expanded(
                child: Obx(() => ListView.builder(
                  itemCount: controller.messages.length,
                  itemBuilder: (_, index) {
                    final msg = controller.messages[index];
                    final isUser = msg['role'] == 'user';
                    return Align(
                      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          color: isUser ? const Color(0xFF0E4B36) : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          msg['text'] ?? '',
                          style: TextStyle(color: isUser ? Colors.white : Colors.black87),
                        ),
                      ),
                    );
                  },
                )),
              ),

              // Input Field
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onChanged: (value) => controller.messageController.value = value,
                      decoration: InputDecoration(
                        hintText: "Type your message",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {
                      controller.sendMessage(textController.text);
                      textController.clear();
                    },
                    child: const Text("Send"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
