import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    update();

    switch (index) {
      case 0:
        Get.offAllNamed('/home');
        break;
      case 1:
        Get.toNamed('/tool-shop');
        break;
      case 2:
        Get.toNamed('/gardener');
        break;
      case 3:
        Get.toNamed('/nursery');
        break;
      case 4:
        Get.toNamed('/profile');
        break;
    }
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      init: BottomNavController(),
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex,
            onTap: controller.onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF2E7D32),
            unselectedItemColor: Colors.grey[600],
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
            backgroundColor: Colors.white,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, size: 24),
                activeIcon: Icon(Icons.home, size: 26),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.handyman_outlined, size: 24),
                activeIcon: Icon(Icons.handyman, size: 26),
                label: 'Tool Shop',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.eco_outlined, size: 24),
                activeIcon: Icon(Icons.eco, size: 26),
                label: 'Gardener',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_florist_outlined, size: 24),
                activeIcon: Icon(Icons.local_florist, size: 26),
                label: 'Nursery',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 24),
                activeIcon: Icon(Icons.person, size: 26),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
