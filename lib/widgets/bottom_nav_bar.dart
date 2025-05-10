import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
    // You can navigate here if needed based on index
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      init: BottomNavController(),
      builder: (controller) {
        return BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          onTap: controller.onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green[800],
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.eco), label: 'Find Gardener'),
            BottomNavigationBarItem(icon: Icon(Icons.local_florist), label: 'Find Nursery'),
            BottomNavigationBarItem(icon: Icon(Icons.handyman), label: 'Find Tool Shop'),
          ],
        );
      },
    );
  }
}
