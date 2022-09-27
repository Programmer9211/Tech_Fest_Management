import 'package:get/get.dart';

import '../controllers/download_certificate_controller.dart';

class DownloadCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DownloadCertificateController>(
      () => DownloadCertificateController(),
    );
  }
}
