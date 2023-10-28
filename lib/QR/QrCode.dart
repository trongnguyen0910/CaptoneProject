import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:crypto/crypto.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Controller/PlantController.dart';
import '../Plant/PlantDetail.dart';

class QrCode extends StatelessWidget {
  final DataPlant dataPlant;

  QrCode({Key? key, required this.dataPlant}) : super(key: key);

  GlobalKey globalKey = GlobalKey();

  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    String originalString = '${dataPlant.md5Hash}';
    String md5Hash = generateMd5(originalString);

    String qrData = md5Hash;
    var qrImage = QrImage(
      data: qrData,
      version: QrVersions.auto,
      size: 200,
    );

    void saveQrImage() async {
  RenderRepaintBoundary boundary =
      globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  ui.Image image = await boundary.toImage();
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  if (byteData != null) {
    Uint8List pngBytes = byteData.buffer.asUint8List();

    final result = await ImageGallerySaver.saveImage(pngBytes);

    if (result != null) {
      print('Hình ảnh đã được lưu vào: $result');
    } else {
      print('Lưu hình ảnh thất bại.');
    }
  } else {
    print('Chụp hình ảnh thất bại.');
  }
}


    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Detail', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlantDetail(dataPlant: dataPlant)),
            );
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0 * fem, 20 * fem, 0 * fem, 35 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 57.61 * fem),
                child: Text(
                  'Scan to see detail of plant',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18 * ffem,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
            Expanded(
              child: RepaintBoundary(
                key: globalKey,
                child: Container(
                  margin: EdgeInsets.fromLTRB(50 * fem, 0 * fem, 0 * fem, 22.15 * fem),
                  width: 300 * fem,
                  height: 300 * fem,
                  child: qrImage,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(4 * fem, 0 * fem, 0 * fem, 1.13 * fem),
              child: Text(
                '${dataPlant.cropName}',
                style: TextStyle(
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 65.72 * fem),
                constraints: BoxConstraints(maxWidth: 187 * fem),
                child: Text(
                  '${dataPlant.gardenName}\n01/04/2023 - 15/07/2023',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15 * ffem,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(17 * fem, 0 * fem, 17 * fem, 30 * fem),
              width: double.infinity,
              height: 60 * fem,
              decoration: BoxDecoration(
                color: Color(0xff6cc51d),
                borderRadius: BorderRadius.circular(5 * fem),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f6cc51d),
                    offset: Offset(0 * fem, 10 * fem),
                    blurRadius: 4.5 * fem,
                  ),
                ],
              ),
              child: TextButton(
                onPressed: saveQrImage,
                child: Text(
                  'Save to your library',
                  style: TextStyle(
                    fontSize: 15 * ffem,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(17 * fem, 0 * fem, 17 * fem, 0 * fem),
              width: double.infinity,
              height: 60 * fem,
              decoration: BoxDecoration(
                color: Color(0xff6cc51d),
                borderRadius: BorderRadius.circular(5 * fem),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3f6cc51d),
                    offset: Offset(0 * fem, 10 * fem),
                    blurRadius: 4.5 * fem,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Share QR Code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15 * ffem,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
