import 'package:get/get.dart';

class NurseryController extends GetxController {
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

  final List<Map<String, dynamic>> nurseries = [
    {
      'name': 'Green Thumb Nursery',
      'distance': 3.2,
      'location': 'Gazipur, Dhaka',
      'division': 'Dhaka',
    },
    {
      'name': 'Eco Flora',
      'distance': 4.8,
      'location': 'Tongi, Dhaka',
      'division': 'Dhaka',
    },
    {
      'name': 'Botanic Haven',
      'distance': 7.1,
      'location': 'Savar, Dhaka',
      'division': 'Dhaka',
    },
    {
      'name': 'Evergreen Nursery',
      'distance': 8.5,
      'location': 'Dhanmondi, Dhaka',
      'division': 'Dhaka',
    },
  ];

  List<Map<String, dynamic>> get filteredNurseries {
    if (filterType == 'Distance') {
      return nurseries.where((n) => n['distance'] <= selectedDistance).toList();
    } else {
      return nurseries.where((n) => n['division'] == selectedDivision).toList();
    }
  }
}
