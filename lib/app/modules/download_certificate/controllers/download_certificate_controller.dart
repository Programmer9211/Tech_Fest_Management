import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tech_fest_management/app/data/indictor.dart';

class DownloadCertificateController extends GetxController {
  Dio dio = Dio();
  double progress = 0.0;

  void getPermission() async {
    if (await Permission.storage.isGranted &&
        await Permission.accessMediaLocation.isGranted) {
      startDownloading();
    } else {
      await Permission.storage.request();
      await Permission.accessMediaLocation.request();
    }
  }

  void startDownloading() async {
    const String url =
        'https://firebasestorage.googleapis.com/v0/b/tech-fest-b5a33.appspot.com/o/certificate.png?alt=media&token=f7c0d0f8-2a3c-44d1-986b-e5610b3c10be';

    const String fileName = "Certificate.jpg";

    String path = await _getFilePath(fileName);

    await dio.download(
      url,
      path,
      onReceiveProgress: (recivedBytes, totalBytes) {
        progress = recivedBytes / totalBytes;

        print(progress);
      },
      deleteOnError: true,
    ).then((_) {
      Indicator.showSnackBar("Certificate Downloaded Sucessfully");
    });
  }

  Future<String> _getFilePath(String filename) async {
    final dir = Directory("/storage/emulated/0/Download");

    if (!(await dir.exists())) {
      await dir.create();
    }

    return "${dir.path}/$filename";
  }
}
