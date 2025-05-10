import 'package:get/get.dart';

class ToolShopController extends GetxController {
  int selectedDistance = 5;
  String selectedDivision = 'Dhaka';
  String filterType = 'Distance';

  final List<String> divisions = [
    'Dhaka', 'Chittagong', 'Rajshahi', 'Khulna',
    'Barisal', 'Sylhet', 'Rangpur', 'Mymensingh'
  ];

  void updateDistance(int km) {
    selectedDistance = km;
    update();
  }

  void updateDivision(String division) {
    selectedDivision = division;
    update();
  }

  void updateFilterType(String type) {
    filterType = type;
    update();
  }

  final List<Map<String, dynamic>> toolShops = [
    {
      'name': 'GrowTools BD',
      'distance': 3.5,
      'location': 'Gazipur, Dhaka',
      'division': 'Dhaka',
    },
    {
      'name': 'Green Gear',
      'distance': 6.0,
      'location': 'Tongi, Dhaka',
      'division': 'Dhaka',
    },
    {
      'name': 'GardenPro Tools',
      'distance': 8.2,
      'location': 'Savar, Dhaka',
      'division': 'Dhaka',
    },
    {
      'name': 'Barisal Tools',
      'distance': 15.4,
      'location': 'Barisal Sadar',
      'division': 'Barisal',
    },
  ];

  List<Map<String, dynamic>> get filteredToolShops {
    if (filterType == 'Distance') {
      return toolShops.where((t) => t['distance'] <= selectedDistance).toList();
    } else {
      return toolShops.where((t) => t['division'] == selectedDivision).toList();
    }
  }
}
