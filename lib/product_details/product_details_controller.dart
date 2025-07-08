import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  late String name;
  late String price;
  late String description;
  late String image;
  late bool inStock;

  var quantity = 1.obs;

  void initProduct(Map<String, dynamic> product) {
    name = product['name'] ?? '';
    price = product['price']?.toString() ?? '0';
    description = product['description'] ?? _defaultDescription();
    image = product['image'] ?? '';
    inStock = product['inStock'] ?? true;
  }

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  String _defaultDescription() {
    return "$name is a great addition to your garden. It’s easy to care for and brings life to your space.";
  }
}
