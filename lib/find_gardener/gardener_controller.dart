import 'package:get/get.dart';

class GardenerController extends GetxController {
  int selectedDistance = 5;
  String selectedDivision = 'Dhaka';
  String filterType = 'Distance';

  final List<String> divisions = [
    'Dhaka',
    'Chittagong',
    'Rajshahi',
    'Khulna',
    'Barisal',
    'Sylhet',
    'Rangpur',
    'Mymensingh',
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

  final List<Map<String, dynamic>> gardeners = [
    {
      'name': 'Sagor',
      'distance': 3.2,
      'location': 'Gazipur, Dhaka',
      'division': 'Dhaka',
      'services': ['Pest Control', 'Distance'],
      'photo': 'assets/png/sagor.png',
    },
    {
      'name': 'Anika',
      'distance': 4.8,
      'location': 'Tangi, Dhaka',
      'division': 'Dhaka',
      'services': ['Plant Care', 'Landscape Design'],
      'photo': 'assets/png/sagor.png',
    },
    {
      'name': 'Fahim',
      'distance': 6.5,
      'location': 'Savar, Dhaka',
      'division': 'Dhaka',
      'services': ['Pest Control'],
      'photo': 'assets/png/sagor.png',
    },
    {
      'name': 'Lima',
      'distance': 12.3,
      'location': 'Barisal Sadar',
      'division': 'Barisal',
      'services': ['Plant Care'],
      'photo': 'assets/png/sagor.png',
    },
    {
      'name': 'Raihan',
      'distance': 18.7,
      'location': 'Sylhet Town',
      'division': 'Sylhet',
      'services': ['Landscape Design'],
      'photo': 'assets/png/sagor.png',
    },
  ];

  List<Map<String, dynamic>> get filteredGardeners {
    if (filterType == 'Distance') {
      return gardeners.where((g) => g['distance'] <= selectedDistance).toList();
    } else {
      return gardeners.where((g) => g['division'] == selectedDivision).toList();
    }
  }
}
