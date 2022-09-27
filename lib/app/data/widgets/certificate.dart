import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

class Certificate extends StatelessWidget {
  const Certificate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pdf = pw.Document();
    final assetImage = AssetImage("assets/certificate.png");
    return Container(
      
      child: pdf.addPage(pw.Page(build: (pw.Context context) {
      return pw.Column(children: [
        pw.Text(
          "Certificate of",
          style: pw.TextStyle(
            fontSize: 24,
          ),
        ),
        pw.Image(assetImage),
      ]);
    }))
    );
  }
}
