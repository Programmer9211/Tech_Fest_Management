import 'package:get/get.dart';

class HomeController extends GetxController {


  List<String> peoples = [
    "Image/asset.png",
    "Image/asset.png",
    "Image/asset.png",
    "Image/asset.png",
  ];


  List<String> carouselSliderImage = [];
  // List<EventModel> eventsModel = [];
  List<RxBool> isSelected = [];

   void onPageChanged(int value) {}

  // void changeIndicator(int index) {
  //   for (var i = 0; i < isSelected.length; i++) {
  //     if (isSelected[i].value) {
  //       isSelected[i].value = false;
  //     }
  //   }

  //   isSelected[index].value = true;
  // }

  // void getBannerData() async {
  //   List<String>? caroselModel = await HomeDbFunctions.getSliderData();

  //   if (caroselModel != null) {
  //     carouselSliderImage = caroselModel;
  //   }

  //   for (var i = 0; i < carouselSliderImage.length; i++) {
  //     isSelected.add(false.obs);
  //   }

  //   isSelected[0].value = true;
  // }

  // void getAllEvents() async {
  //   List<EventModel>? eventModel = await HomeDbFunctions.getAllEvents();

  //   if (eventModel != null) {
  //     eventsModel = eventModel;
  //   }
  // }
}


