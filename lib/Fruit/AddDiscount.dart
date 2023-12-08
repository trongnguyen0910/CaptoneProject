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
import '../Controller/DataFruitController.dart';
import '../Controller/GardenController.dart';
import '../Controller/PlantController.dart';
import '../GetX/GardenGetX.dart';
import 'ViewFruit.dart';

class AddDiscount extends StatefulWidget {
  final int fruitId;
   const AddDiscount({Key? key, required this.fruitId}) : super(key: key);
  @override
  State<AddDiscount> createState() => _AddDiscountState();
}

class _AddDiscountState extends State<AddDiscount> {
  final _discountNameController = TextEditingController();
  final _discountThresholdController = TextEditingController();
  final _discountPercentageController = TextEditingController();
  final TextEditingController _date = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
 _creatediscount() async {
  final prefs = await SharedPreferences.getInstance();
  final accountID = prefs.getInt('accountID');
  final accessToken = prefs.getString('accessToken');
  print('acc: $accountID');
  var discountName = _discountNameController.text;
  var discountThreshold = _discountThresholdController.text;
  var discountPercentage = _discountPercentageController.text;
  var fruitId = widget.fruitId;
  var date = _date.text;

  var apiUrl = 'https://fruitseasonms.azurewebsites.net/api/fruit-discounts';
  var headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };

  var body = json.encode({
    'fruitId': fruitId.toString(),
    'discountName': discountName,
    'discountThreshold': discountThreshold,
    'discountPercentage': discountPercentage,
    'discountExpiryDate': date,
  });

  try {
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: body,
    );

    var statusCode = response.statusCode;
    print('Status code: $statusCode');

    if (response.statusCode == 200) {
      print('ok');
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: AwesomeSnackbarContent(
          title: 'Success',
          message: 'Operation was successful',
          contentType: ContentType.success,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
      Future.delayed(Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ViewFruit()),
        );
      });
    } else if (response.statusCode != 200) {
      var responseBody = json.decode(response.body);
      var errorMessage = responseBody['errors'];
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
      print('Response body: ${response.body}');
      print('Error 400: $errorMessage');
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception: $e');
  }
}
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        appBar: AppBar(
          title: Text('Thêm Thông Tin Giảm Giá',
              style: TextStyle(color: Colors.black)),
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
            height: 756 * fem,
            decoration: BoxDecoration(
              color: Color(0xfff4f5f9),
            ),
            child: Stack(
              children: [
                Positioned(
                  // bodyCRn (3154:3130)
                  left: 18 * fem,
                  top: 20 * fem,
                  child: Container(
                    width: 392.88 * fem,
                    height: 762.71 * fem,
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
                                                labelText: 'Tên giảm giá',
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
                                                  _discountNameController,
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
                                                labelText: 'Số lượng người mua',
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
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  _discountThresholdController,
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
                                                labelText:
                                                    'Phần trăm giảm giá',
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
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  _discountPercentageController,
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
                                          DateTime? pickeddate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1000),
                                                  lastDate: DateTime(2101));
                                          if (pickeddate != null) {
                                            setState(() {
                                              _date.text =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickeddate);
                                            });
                                          }
                                        },
                                        controller: _date,
                                        decoration: InputDecoration(
                                          labelText: 'Ngày hết hạn',
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
                            _creatediscount();
                          },
                          child: Container(
                            // primarybuttonoyi (3152:2964)
                            margin: EdgeInsets.fromLTRB(
                                0.03 * fem, 50 * fem, 0 * fem, 0 * fem),
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
                                'Lưu thay đổi',
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
              ],
            ),
          ),
        ));
  }
}
