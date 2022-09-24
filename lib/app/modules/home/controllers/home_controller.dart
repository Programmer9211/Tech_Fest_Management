import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  List<String> peoples = [
    "Image/asset.png",
    "Image/asset.png",
    "Image/asset.png",
    "Image/asset.png",
  ];

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
