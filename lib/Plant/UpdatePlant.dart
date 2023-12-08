import 'dart:convert';
import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:myapp/utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Controller/GardenController.dart';
import '../Controller/GardenTaskController.dart';
import '../Controller/PlantController.dart';
import '../GetX/GardenGetX.dart';
import '../HomeScreen/Home.dart';

class UpdatePlantScreen extends StatefulWidget {
  final DataPlant dataPlant;

  UpdatePlantScreen({Key? key, required this.dataPlant}) : super(key: key);

  @override
  State<UpdatePlantScreen> createState() => _UpdatePlantScreenState();
}

class _UpdatePlantScreenState extends State<UpdatePlantScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController _plantNameController;
  late TextEditingController _plantDescriptionController;
  late TextEditingController _plantingdate;
  late TextEditingController _harvestingdate;
  late TextEditingController _quantityPlanted;
  late TextEditingController _estimatedHarvestQuantity;
  late TextEditingController _image;
  late TextEditingController _statusController;
  String? _selectedStatus;
  @override
  void initState() {
    super.initState();

    _plantNameController =
        TextEditingController(text: widget.dataPlant.plantName);
    _plantDescriptionController =
        TextEditingController(text: widget.dataPlant.description);
    _image = TextEditingController(text: widget.dataPlant.image ?? '');
    _statusController = TextEditingController(text: widget.dataPlant.status!);
    _selectedStatus = _statusController.text;
    _plantingdate = TextEditingController(
        text: DateFormat('yyyy-MM-dd').format(widget.dataPlant.plantingDate!));
    _harvestingdate = TextEditingController(
        text:
            DateFormat('yyyy-MM-dd').format(widget.dataPlant.harvestingDate!));
    _quantityPlanted = TextEditingController(
        text: widget.dataPlant.quantityPlanted.toString());
    _estimatedHarvestQuantity = TextEditingController(
        text: widget.dataPlant.estimatedHarvestQuantity.toString());
  }

  File? image;

  Future pickImage() async {
    try {
      final imagePicker = ImagePicker();
      final pickedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        final imageFile = File(pickedImage.path);
        setState(() {
          image = imageFile;
        });
      } else {
        print('No image selected');
        setState(() {
          image = null;
          _image.text = widget.dataPlant.image ?? '';
        });
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> updateplant(int plantID) async {
    final prefs = await SharedPreferences.getInstance();
    final accountID = prefs.getInt('accountID');
    final accessToken = prefs.getString('accessToken');
    print('acc: $accountID');
    var plantName = _plantNameController.text;
    var plantDescription = _plantDescriptionController.text;
    var quantityPlanted = _quantityPlanted.text;
    var estimatedHarvestQuantity = _estimatedHarvestQuantity.text;
    var status = _statusController.text;
    var plantingdate = _plantingdate.text;
    var harvestingdate = _harvestingdate.text;
    print('status: $status');
    print('estimatedHarvestQuantity: $estimatedHarvestQuantity');

    var request = http.MultipartRequest(
      'PUT',
      Uri.parse('https://fruitseasonms.azurewebsites.net/api/plants/$plantID'),
    );
    request.headers['accept'] = 'multipart/form-data';
    request.headers['Authorization'] = 'Bearer $accessToken';
    request.fields['PlantName'] = plantName;
    request.fields['Description'] = plantDescription;
    request.fields['PlantingDate'] = plantingdate;
    request.fields['HarvestingDate'] = harvestingdate;
    request.fields['QuantityPlanted'] = quantityPlanted;
    request.fields['EstimatedHarvestQuantity'] = estimatedHarvestQuantity;
    request.fields['Status'] = status;
    // var data = {
    //   "taskName": taskname,
    //   "description": taskdescription,
    //   "region": garden,
    //   "userId": accountID,
    //   "image": imageURL,
    // };
    // request.body = jsonEncode(data);
    String imageURL = image != null ? image!.path : _image.text;

    if (imageURL.isEmpty && image == null) {
      // No image selected, use the API image
      print('No image selected, using API image');
      imageURL = _image.text;
    }

    if (image != null) {
      var imageFile = File(image!.path);
      var imageStream = http.ByteStream(imageFile.openRead());
      var imageLength = await imageFile.length();

      var multipartFile = http.MultipartFile(
        'UploadFile',
        imageStream,
        imageLength,
        filename: imageFile.path,
        contentType: MediaType('image', 'png'),
      );
      request.files.add(multipartFile);
    }

    try {
      var response = await request.send();
      var statusCode = response.statusCode;
      print('Status code: $statusCode');

      if (response.statusCode == 200) {
        print('ok');
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green, // Màu nền màu xanh
          content: AwesomeSnackbarContent(
            title: 'Success', // Tiêu đề thành công
            message: 'Operation was successful', // Tin nhắn thành công
            contentType: ContentType.success, // Loại snackbar thành công
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        Future.delayed(Duration(seconds: 2), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        });
      } else if (response.statusCode != 200) {
        var responseString = await response.stream.bytesToString();
        var responseBody = json.decode(responseString);
        var errorMessage = responseBody['message'];
        String errorContent = errorMessage.toString();
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Error',
            message: errorContent,
            contentType: ContentType.failure,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        print('Response body: $responseString');
        print('Error 400: $errorMessage');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  Map<String, String> valueMappings = {
    'YoungTree': 'Cây trẻ',
    'FloweringTree': 'Cây đang nở hoa',
    'Harvestable': 'Cây có thể thu hoạch',
    'Diseased': 'Cây bị bệnh',
    'Dead': 'Cây chết',
    'Seed': 'Hạt giống',
    'GerminatedSeed': 'Hạt giống đã nảy mầm',
    'Seedling': 'Cây con',
  };

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        appBar: AppBar(
          title: Text('Cập nhật', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            // creategardentask5rx (3154:3128)
            width: double.infinity,
            height: 1236 * fem,
            decoration: BoxDecoration(
              color: Color(0xfff4f5f9),
            ),
            child: Stack(
              children: [
                Positioned(
                  // bodyCRn (3154:3130)
                  left: 18 * fem,
                  top: 318 * fem,
                  child: Container(
                    width: 392.88 * fem,
                    height: 992.71 * fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // detailVfn (3154:3132)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0.88 * fem, 30.7 * fem),
                          width: 392 * fem,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5 * fem),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // namezMe (3154:3143)
                                padding: EdgeInsets.fromLTRB(
                                    15 * fem, 15 * fem, 14 * fem, 12 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // autogroupdmqlhG4 (LtKoAgTTv81Bq2o4bfDmQL)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 12 * fem),
                                      width: double.infinity,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                labelText: 'Tên cây trồng',
                                                labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontSize: 15 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.45 * fem,
                                                ),
                                                suffixText: '*',
                                                suffixStyle: TextStyle(
                                                  color: Color(0xffe74c3c),
                                                  fontSize: 15 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.45 * fem,
                                                ),
                                              ),
                                              controller: _plantNameController,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25 * fem,
                              ),
                              Container(
                                // descriptionFD2 (3154:3138)
                                padding: EdgeInsets.fromLTRB(
                                    15 * fem, 15 * fem, 14 * fem, 12 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogrouprualwbe (LtKo124tzte1199DWYRUAL)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 12 * fem),
                                      width: double.infinity,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                labelText: 'Mô tả',
                                                labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontSize: 15 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.45 * fem,
                                                ),
                                                suffixText: '*',
                                                suffixStyle: TextStyle(
                                                  color: Color(0xffe74c3c),
                                                  fontSize: 15 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.45 * fem,
                                                ),
                                              ),
                                              controller:
                                                  _plantDescriptionController,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25 * fem,
                              ),
                              Container(
                                // descriptionFD2 (3154:3138)
                                padding: EdgeInsets.fromLTRB(
                                    15 * fem, 15 * fem, 14 * fem, 12 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogrouprualwbe (LtKo124tzte1199DWYRUAL)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 12 * fem),
                                      width: double.infinity,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                labelText: 'Số lượng cây trồng',
                                                labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontSize: 15 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.45 * fem,
                                                ),
                                                suffixText: '*',
                                                suffixStyle: TextStyle(
                                                  color: Color(0xffe74c3c),
                                                  fontSize: 15 * ffem,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 0.45 * fem,
                                                ),
                                              ),
                                              controller: _quantityPlanted,
                                              keyboardType:
                                                  TextInputType.number,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25 * fem,
                              ),
                              Container(
                                // descriptionFD2 (3154:3138)
                                padding: EdgeInsets.fromLTRB(
                                    15 * fem, 15 * fem, 14 * fem, 12 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // autogrouprualwbe (LtKo124tzte1199DWYRUAL)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 12 * fem),
                                      width: double.infinity,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child:
                                                DropdownButtonFormField<String>(
                                              isExpanded: true,
                                              value: _selectedStatus,
                                              decoration: InputDecoration(
                                                labelText: 'Trạng thái',
                                                labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              items: valueMappings.keys
                                                  .map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(valueMappings[
                                                      value]!), // Hiển thị giá trị tiếng Việt
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                // Set the new selected value
                                                setState(() {
                                                  _selectedStatus = newValue;
                                                  _statusController.text =
                                                      newValue!;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Form(
                                        key: _formKey,
                                        child: Visibility(
                                          visible:
                                              _selectedStatus == 'Harvestable',
                                          child: Container(
                                            // autogrouprualwbe (LtKo124tzte1199DWYRUAL)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 12 * fem),
                                            width: double.infinity,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Ước tính thu hoạch/kg',
                                                      labelStyle: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontSize: 15 * ffem,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing:
                                                            0.45 * fem,
                                                      ),
                                                      suffixText: '*',
                                                      suffixStyle: TextStyle(
                                                        color:
                                                            Color(0xffe74c3c),
                                                        fontSize: 15 * ffem,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing:
                                                            0.45 * fem,
                                                      ),
                                                    ),
                                                    validator: (value) {
                                                      if (double.parse(value!) <
                                                          0) {
                                                        return 'Estimated harvest quantity cannot be negative';
                                                      }
                                                    },
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller:
                                                        _estimatedHarvestQuantity,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25 * fem,
                              ),
                              Container(
                                // startdAx (3154:3256)
                                padding: EdgeInsets.fromLTRB(
                                    15 * fem, 15 * fem, 15 * fem, 25 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1000),
                                            lastDate: DateTime(2101),
                                          );

                                          if (pickedDate != null) {
                                            setState(() {
                                              _plantingdate.text =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickedDate);
                                            });
                                          }
                                        },
                                        controller: _plantingdate,
                                        decoration: InputDecoration(
                                          labelText: 'Ngày trồng',
                                          labelStyle: TextStyle(
                                            fontFamily: 'Satoshi',
                                            fontSize: 15 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.2575 * ffem / fem,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value?.isEmpty == true) {
                                            return 'Please enter your date';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25 * fem,
                              ),
                              Container(
                                // startdAx (3154:3256)
                                padding: EdgeInsets.fromLTRB(
                                    15 * fem, 15 * fem, 15 * fem, 25 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(1000),
                                            lastDate: DateTime(2101),
                                          );

                                          if (pickedDate != null) {
                                            setState(() {
                                              _harvestingdate.text =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickedDate);
                                            });
                                          }
                                        },
                                        controller: _harvestingdate,
                                        decoration: InputDecoration(
                                          labelText: 'Ngày thu hoạch',
                                          labelStyle: TextStyle(
                                            fontFamily: 'Satoshi',
                                            fontSize: 15 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.2575 * ffem / fem,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value?.isEmpty == true) {
                                            return 'Please enter your date';
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState?.validate() == false) {
                              return;
                            }
                            updateplant(widget.dataPlant.plantId!);
                          },
                          child: Container(
                            // primarybuttonoyi (3152:2964)
                            margin: EdgeInsets.fromLTRB(
                                0.03 * fem, 0 * fem, 0 * fem, 0 * fem),
                            width: double.infinity,
                            height: 62.01 * fem,
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
                                'Lưu',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5 * ffem / fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // rectangle60edn (3154:3168)
                  left: 0 * fem,
                  top: 5 * fem,
                  child: GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: Align(
                      child: image != null
                          ? Image.file(
                              image!,
                              width: 128,
                              height: 128,
                              fit: BoxFit.cover,
                            )
                          : SizedBox(
                              width: 428 * fem,
                              height: 300 * fem,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5 * fem),
                                child: Image.network(
                                  _image.text.isNotEmpty
                                      ? _image
                                          .text // Display the image if it exists in the controller
                                      : 'assets/mobile/images/add-image.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
