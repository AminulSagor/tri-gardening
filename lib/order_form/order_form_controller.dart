import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../order_success/order_success_view.dart';

class OrderFormController extends GetxController {
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();

  final selectedThana = ''.obs;
  final selectedDistrict = ''.obs;

  final thanaList = ['Banani', 'Gulshan', 'Dhanmondi', 'Mirpur'];
  final districtList = ['Dhaka', 'Chattogram', 'Khulna', 'Rajshahi'];

  void confirmOrder() {
    final phone = phoneController.text.trim();
    final name = nameController.text.trim();
    final address = addressController.text.trim();

    if (phone.isEmpty || name.isEmpty || address.isEmpty || selectedThana.value.isEmpty || selectedDistrict.value.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields");
      return;
    }

    Get.to(() => OrderSuccessView(
      deliveryCharge: 120,
      totalAmount: 420,
    ));

    Get.snackbar("Success", "Your order has been placed successfully!");
  }

  @override
  void onClose() {
    phoneController.dispose();
    nameController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
