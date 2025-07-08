import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'about_us_controller.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AboutUsController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.companyName,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'About Us',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Our Story',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 12),
            Text(
              controller.story,
              style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
            ),
            const SizedBox(height: 32),
            const Text(
              'Contact Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 16),
            _buildContactRow(Icons.location_on, controller.address),
            const SizedBox(height: 12),
            _buildContactRow(Icons.email, controller.email),
            const SizedBox(height: 12),
            _buildContactRow(Icons.phone, controller.phone),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.green),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
      ],
    );
  }
}
