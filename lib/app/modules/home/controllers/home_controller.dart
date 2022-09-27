import 'package:get/get.dart';
import 'package:tech_fest_management/app/data/get_storage/get_storage.dart';
import 'package:tech_fest_management/app/data/indictor.dart';
import 'package:tech_fest_management/app/models/event_model.dart';
import 'package:tech_fest_management/app/modules/home/db_functions/db_functions.dart';
import 'package:tech_fest_management/const/app_const/app_keys.dart';

import '../../../data/get_storage/get_storage.dart';

class HomeController extends GetxController {
  EventModel? eventsModel;

  List<String> peoples = [
    "Image/asset.png",
    "Image/asset.png",
    "Image/asset.png",
    "Image/asset.png",
  ];

  List<String> carouselSliderImage = [
    "assets/cr1.png",
    "assets/cr2.png",
    "assets/cr3.png",
  ];
  // List<EventModel> eventsModel = [];
  List<RxBool> isSelected = [true.obs, false.obs, false.obs];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(Storage.getValue(AppKeys.isProfileComplete));
  }

  void onPageChanged(int value) {
    for (var element in isSelected) {
      element.value = false;
    }

    isSelected[value].value = true;
  }

  void changeIndicator(int index) {
    for (var i = 0; i < isSelected.length; i++) {
      if (isSelected[i].value) {
        isSelected[i].value = false;
      }
    }

    isSelected[index].value = true;
  }

  void getAllEvents() async {
    Indicator.showLoading();
    eventsModel = await HomeDbFunctions.getAllEvents();
    update();

    Indicator.closeLoading();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getAllEvents();
  }

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

  void onChangeTheme() {
    AppTheme.isDarkMode =! AppTheme.isDarkMode;
    if (AppTheme.isDarkMode) {
      Storage.setDarkTheme;
    } else {
      Storage.setLightTheme;
    }
    update();
  }

}
