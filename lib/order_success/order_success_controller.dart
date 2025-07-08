import 'package:get/get.dart';

class OrderSuccessController extends GetxController {
  late int deliveryCharge;
  late int totalAmount;

  void initData({required int deliveryCharge, required int totalAmount}) {
    this.deliveryCharge = deliveryCharge;
    this.totalAmount = totalAmount;
  }
}
