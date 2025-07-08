import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'order_form_controller.dart';

class OrderFormView extends StatelessWidget {
  const OrderFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderFormController());

    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF7),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enter Your Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 24),

              // Phone & Name
              _buildTextField(label: "Name", controller: controller.phoneController),
              const SizedBox(height: 16),
              _buildTextField(label: "Phone Number", controller: controller.nameController),
              const SizedBox(height: 16),

              // Thana & District
              Row(
                children: [
                  Expanded(child: _buildDropdown(controller, "District", controller.thanaList, controller.selectedThana)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildDropdown(controller, "Thana", controller.districtList, controller.selectedDistrict)),
                ],
              ),

              const SizedBox(height: 16),

              // Detail Address (moved to bottom, bigger box)
              _buildTextField(
                label: "Detail Address",
                controller: controller.addressController,
                maxLines: 5,
              ),

              const SizedBox(height: 24),

              // Confirm Order Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: controller.confirmOrder,
                  child: const Text("Confirm Order", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(OrderFormController controller, String hint, List<String> items, RxString selectedItem) {
    return Obx(() {
      return DropdownButtonFormField<String>(
        value: selectedItem.value.isEmpty ? null : selectedItem.value,
        hint: Text(hint),
        items: items
            .map((e) => DropdownMenuItem<String>(
          value: e,
          child: Text(e),
        ))
            .toList(),
        onChanged: (value) => selectedItem.value = value ?? '',
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          filled: true,
          fillColor: Colors.white,
        ),
      );
    });
  }
}
