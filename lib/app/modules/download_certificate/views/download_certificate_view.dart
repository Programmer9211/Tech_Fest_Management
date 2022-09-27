import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tech_fest_management/app/data/widgets/custom_button.dart';

import '../controllers/download_certificate_controller.dart';

class DownloadCertificateView extends GetView<DownloadCertificateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: KButton(
            title: "Donwload Certificate",
            onTap: () {
              controller.getPermission();
            },
          ),
        ),
      ),
    );
  }
}
