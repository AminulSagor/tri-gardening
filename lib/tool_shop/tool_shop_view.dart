import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/bottom_nav_bar.dart';
import 'tool_shop_controller.dart';

class ToolShopView extends StatelessWidget {
  const ToolShopView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToolShopController>(
      init: ToolShopController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF0E4B36),
            elevation: 0,
            leading: const BackButton(color: Colors.white),
            centerTitle: true,
            title: const Text(
              "Tri Gardening",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Find Tool Shop", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButtonFormField<String>(
                  value: controller.filterType,
                  decoration: InputDecoration(
                    hintText: 'Filter by',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  items: ['Distance', 'Division'].map((item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) controller.updateFilterType(val);
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: controller.filterType == 'Distance'
                        ? [5, 10, 20, 50].map((km) {
                      final isSelected = km == controller.selectedDistance;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text('$km km'),
                          selected: isSelected,
                          onSelected: (_) => controller.updateDistance(km),
                          selectedColor: const Color(0xFF0E4B36),
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    }).toList()
                        : controller.divisions.map((division) {
                      final isSelected = division == controller.selectedDivision;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(division),
                          selected: isSelected,
                          onSelected: (_) => controller.updateDivision(division),
                          selectedColor: const Color(0xFF0E4B36),
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.filteredToolShops.length,
                  separatorBuilder: (_, __) => const Divider(height: 32),
                  itemBuilder: (_, index) {
                    final shop = controller.filteredToolShops[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(shop['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              Text('${shop['distance']} km away'),
                              Text('📍 ${shop['location']}'),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0E4B36),
                          ),
                          child: const Text('View Shop', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar: const BottomNavBar(),
        );
      },
    );
  }
}
