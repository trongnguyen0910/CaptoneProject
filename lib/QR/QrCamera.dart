import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_tools/qr_code_tools.dart';
import '../Controller/PlantController.dart';
import '../Plant/PlantDetail.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  String? scannedData;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> startScanning() async {
    final controller = _qrKey.currentState as QRViewController;
    controller.resumeCamera();
  }

  Future<void> stopScanning() async {
    final controller = _qrKey.currentState as QRViewController;
    controller.pauseCamera();
  }

  Future<void> scanQRFromImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      final String qrText = await QrCodeToolsPlugin.decodeFrom(image.path);
      setState(() {
        scannedData = qrText;
        if (scannedData != null) {
          List<String> dataParts = scannedData!.split(', ');

          if (dataParts.length >= 7) {
            String cropName = dataParts[0];
            String description = dataParts[1];
            String imageUrl = dataParts[2];
            String gardenName = dataParts[3];
            String plantingDate = dataParts[4];
            String harvestingDate = dataParts[5];
            String plantIdString = dataParts[6];
            int plantId = int.parse(plantIdString);
            DateTime plantingDateTime = DateTime.parse(plantingDate);
            DateTime harvestingDateTime = DateTime.parse(harvestingDate);

            DataPlant dataPlant = DataPlant(
              plantName: cropName,
              description: description,
              image: imageUrl,
              gardenName: gardenName,
              plantId: plantId,
              plantingDate: plantingDateTime,
              harvestingDate: harvestingDateTime,
            );

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlantDetail(dataPlant: dataPlant),
              ),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Invalid QR Code Format'),
                content: Text(
                    'The scanned QR code does not contain the expected data format.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          }
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('No QR Code Found'),
              content: Text('The selected image does not contain a QR code.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      });
    } else {
      if (controller != null) {
        startScanning();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: scanQRFromImage,
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(
                    255, 50, 167, 58), // Change the background color here
              ),
              child: Text('Choose Image from Gallery'),
            ),
            if (scannedData != null)
              Padding(
                padding: EdgeInsets.all(20),
                child: Text('Scanned QR Code Data: $scannedData'),
              ),
            Expanded(
              child: QRView(
                key: _qrKey,
                onQRViewCreated: (controller) {
                  this.controller = controller;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
