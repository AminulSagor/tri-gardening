import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/home_view.dart';
import 'order_success_controller.dart';

class OrderSuccessView extends StatelessWidget {
  final int deliveryCharge;
  final int totalAmount;

  const OrderSuccessView({
    super.key,
    required this.deliveryCharge,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderSuccessController());
    controller.initData(deliveryCharge: deliveryCharge, totalAmount: totalAmount);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.green,
                child: Icon(Icons.check, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 24),
              const Text(
                "Order Placed\nSuccessfully",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "We will contact you soon. Pay us when the delivery man delivers.\n"
                    "Delivery Charge: ${controller.deliveryCharge} TK. "
                    "Total: ${controller.totalAmount} TK.",
                style: const TextStyle(fontSize: 14, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    Get.offAll(() => const HomeView()); // Clears previous routes and navigates to Home
                  },
                  child: const Text("Back to Home", style: TextStyle(fontSize: 16)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
