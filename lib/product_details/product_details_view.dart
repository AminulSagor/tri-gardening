import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../order_form/order_form_view.dart';
import 'product_details_controller.dart';

class ProductDetailsView extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailsController());
    controller.initProduct(product);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: Container(
          width: 400,
          margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.local_florist, color: Colors.green),
              const SizedBox(height: 8),
              const Text(
                'Tri Gardening',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                controller.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(height: 8),
              Text(
                '৳${controller.price}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              Text(
                controller.inStock ? "In Stock" : "Out of Stock",
                style: TextStyle(
                  color: controller.inStock ? Colors.green : Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Image.asset(
                controller.image,
                height: 180,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              Text(
                controller.description,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Quantity Selector
              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: controller.decreaseQuantity,
                  ),
                  Text(
                    '${controller.quantity.value}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: controller.increaseQuantity,
                  ),
                ],
              )),
              const SizedBox(height: 24),

              // Order Now Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    Get.to(() => OrderFormView(

                    ));
                  },
                  child: const Text("Order Now", style: TextStyle(fontSize: 16)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
