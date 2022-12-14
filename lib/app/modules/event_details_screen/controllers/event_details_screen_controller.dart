import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:tech_fest_management/app/data/get_storage/get_storage.dart';
import 'package:tech_fest_management/app/data/indictor.dart';
import 'package:tech_fest_management/app/models/event_model.dart';
import 'package:tech_fest_management/app/modules/event_details_screen/db_functions/db_functions.dart';
import 'package:tech_fest_management/app/routes/app_pages.dart';
import 'package:tech_fest_management/const/app_const/app_keys.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class EventDetailsScreenController extends GetxController {
  late EventModel eventModel;
  List<RxBool> isSelected = [];
  LocationData? _locationData;
  bool isAlreadyExist = false;
  late Razorpay _razorpay;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initialiseRazorPay();
    eventModel = EventModel.fromJson(Get.arguments);
    for (var element in eventModel.eventImages) {
      isSelected.add(false.obs);
    }
    isSelected.first = true.obs;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _checkIfAlreadyParticipated();
  }

  void _checkIfAlreadyParticipated() async {
    Indicator.showLoading();

    isAlreadyExist =
        await EventDetailsFunctions.checkIfAlreadyRegistered(eventModel.id);

    print(isAlreadyExist);

    update();

    Indicator.closeLoading();
  }

  void onPageChanged(int value) {
    for (var element in isSelected) {
      element.value = false;
    }

    isSelected[value].value = true;
  }

  _getLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }

  void navigateToGoogleMap() async {
    await _getLocation();

    if (_locationData != null) {
      final url =
          'https://www.google.com/maps/dir/?api=1&origin=${_locationData!.latitude},${_locationData!.longitude}&destination=${eventModel.eventLocation.lat},${eventModel.eventLocation.long}&travelmode=driving&dir_action=navigate';

      _launchURL(url);
    }
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void onFillForm() async {
    if (!isAlreadyExist) {
      if (Storage.getValue(AppKeys.isProfileComplete)) {
        if (eventModel.registrationFees == 0) {
          Indicator.showLoading();

          await EventDetailsFunctions.registerUserInApp(eventModel.id);

          Indicator.closeLoading();

          Get.back();
        } else {
          openRazorPay();
        }
      } else {
        Indicator.showSnackBar("Please Complete Your Profile");
        Get.toNamed(Routes.PROFILE_SCREEN);
      }
    }
  }

  void initialiseRazorPay() {
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Indicator.showSnackBar("Registration Sucessfull");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Indicator.showSnackBar("Payement Failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _razorpay.clear();
  }

  void openRazorPay() {
    var options = {
      'key': 'rzp_test_FSFnXQOqPP1YbJ',
      'amount': eventModel.registrationFees + 100,
      'name': eventModel.eventTitle,
      'description': eventModel.eventDescription,
      'prefill': {
        'contact': eventModel.eventContactDetails.phoneNo,
        'email': eventModel.eventContactDetails.email,
      }
    };

    _razorpay.open(options);
  }
}
