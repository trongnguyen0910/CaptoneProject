import 'dart:convert';
import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
import '../Controller/CategoryFruit.dart';
import '../Controller/ComparePriceController.dart';
import '../Controller/GardenController.dart';
import '../Controller/PlantController.dart';
import '../Controller/VarietyController.dart';
import '../Expert/ViewPostExpert.dart';
import '../GetX/GardenGetX.dart';
import 'PostImageFruit.dart';
import 'ViewFruit.dart';

class CreatePost extends StatefulWidget {
  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  final _fruitnameController = TextEditingController();
  final _fruitdescriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityAvailableController = TextEditingController();
  final _quantityInTransit = TextEditingController();
  final _originCityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getPlant();
    getCategory();
  }

  File? image;
  List<DataPlant> dataplant = [];
  List<CategoryFruit> datacategory = [];
  List<DataCompare> trans = [];
  List<DataCompare> allTrans = [];
  int? selectedPlantId;
  int? selectedCategoryId;
  String? _selectedValue;
  bool showCompareOption = false;
  bool showExpertOption = false;
  int page = 1;
  int pageSize = 20;
  double? averagePrice;
  Future<void> getPlant() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final accountID = prefs.getInt('accountID');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/plants/plants?activeOnly=true&gardenId=0&userId=$accountID';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final responseTrans = json.decode(response.body)['data'];
    var statusCode = response.statusCode;
    print('Status code Plant: $statusCode');
    if (responseTrans != null) {
      if (responseTrans is List) {
        setState(() {
          dataplant =
              responseTrans.map((item) => DataPlant.fromJson(item)).toList();
        });
        Get.find<GardenController>().updatePlantList(dataplant);
      }
    }
  }

  Future<void> getPrice() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');

    final url =
        'https://fruitseasonms.azurewebsites.net/api/fruit-histories?page=$page&pageSize=$pageSize&userId=0';

    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };

    final response = await http.get(Uri.parse(url), headers: headers);
    final responseData = json.decode(response.body)['data'];
    print('responseData: $responseData');

    if (responseData != null && responseData is List) {
      // Convert the response data to a list of DataCompare objects
      List<DataCompare> allTrans =
          responseData.map((item) => DataCompare.fromJson(item)).toList();

      // Get the product name from the _fruitnameController
      String productName = _fruitnameController.text.trim().toLowerCase();

      // Filter the list based on the partial product name match
      List<DataCompare> matchingTrans = allTrans
          .where(
              (trans) => trans.fruitName!.toLowerCase().contains(productName))
          .toList();

      if (matchingTrans.isNotEmpty) {
        // Calculate the average price, handling null values
        double sum = matchingTrans
            .map((trans) => trans.price!)
            .fold(0, (prev, price) => prev + (price));

        averagePrice = sum / matchingTrans.length;

        // Display the average price or perform further actions
        print('Average Price: $averagePrice');
        setState(() {});
      } else {
        print('No matching product name found');
      }
    }
  }

  Future<void> getCategory() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/category-products?activeOnly=true';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final responseTrans = json.decode(response.body)['data'];
    var statusCode = response.statusCode;
    print('Status code Category: $statusCode');
    if (responseTrans != null) {
      if (responseTrans is List) {
        setState(() {
          datacategory = responseTrans
              .map((item) => CategoryFruit.fromJson(item))
              .toList();
        });
        Get.find<GardenController>().updateCategoryList(datacategory);
      }
    }
  }

  _createPostFruit() async {
    final prefs = await SharedPreferences.getInstance();
    final accountID = prefs.getInt('accountID');
    final accessToken = prefs.getString('accessToken');
    print('acc: $accountID');
    var fruitname = _fruitnameController.text;
    var fruitdescription = _fruitdescriptionController.text;
    var originCity = _originCityController.text;
    var quantityAvailable = _quantityAvailableController.text;
    var price = _priceController.text;
    var plantId = selectedPlantId;
    var categoryFruitId = selectedCategoryId;
    var orderType = _selectedValue;
    var quantityInTransit = _quantityInTransit.text;
    var userId = accountID;
    print('orderType:${orderType}');
    var url =
        'https://fruitseasonms.azurewebsites.net/api/fruits/fruit-farmers';

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    var data = {
      'fruitName': fruitname,
      'productDescription': fruitdescription,
      'price': price,
      'quantityAvailable': quantityAvailable,
      'quantityInTransit': quantityInTransit,
      'originCity': originCity,
      'orderType': orderType,
      'categoryFruitId': categoryFruitId,
      'plantId': plantId,
      'userId': userId,
    };

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
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
        var responseString = response.body;
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
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  var plantList = Get.find<GardenController>().plantList;
  var categoryList = Get.find<GardenController>().categoryList;
  String? selectedGardenName;
  String? selectedvarietyName;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        appBar: AppBar(
          title: Text('Tạo bài đăng bán trái cây',
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
            height: 1400 * fem,
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
                    height: 1382.71 * fem,
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
                                                labelText: 'Tên trái cây',
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
                                              controller: _fruitnameController,
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
                                                  _fruitdescriptionController,
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
                                                      'Quy cách/kg',
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
                                                    _quantityInTransit),
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
                                                      'Số lượng có sẵn/kg',
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
                                                    _quantityAvailableController),
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
                              GestureDetector(
                                onTap: () {
                                  // Show options when the user taps on the price field
                                  setState(() {
                                    showCompareOption = true;
                                    showExpertOption = true;
                                  });
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Align elements to the start
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(15, 15, 14, 12),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 0, 12),
                                            width: double.infinity,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      labelText: 'Giá/kg',
                                                      labelStyle: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing: 0.45,
                                                      ),
                                                      suffixText: '*',
                                                      suffixStyle: TextStyle(
                                                        color:
                                                            Color(0xffe74c3c),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing: 0.45,
                                                      ),
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    controller:
                                                        _priceController,
                                                    onTap: () {
                                                      // Show options when the user taps on the price field
                                                      setState(() {
                                                        showCompareOption =
                                                            true;
                                                        showExpertOption = true;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (averagePrice != null)
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, top: 0),
                                              child: Text(
                                                  'Giá tham khảo: ${averagePrice}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ),
                                          if (averagePrice == null)
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, top: 0),
                                              child: Text(
                                                  'Không có sản phẩm trong dữ liệu so sánh giá',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ),
                                          // Show options based on the state
                                          if (showCompareOption)
                                            ElevatedButton(
                                              onPressed: () {
                                                getPrice();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors
                                                    .blue, // Background color
                                                onPrimary:
                                                    Colors.white, // Text color
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0), // Border radius
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 13,
                                                    horizontal: 25), // Padding
                                              ),
                                              child: Text(
                                                  'Xem giá đề xuất từ các nền tảng'),
                                            ),

                                          if (showExpertOption)
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ViewPost()),
                                                );
                                                print('View Expert Prices');
                                              },
                                              style: ElevatedButton.styleFrom(
                                                primary: Colors
                                                    .blue, // Background color
                                                onPrimary:
                                                    Colors.white, // Text color
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0), // Border radius
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 14,
                                                    horizontal: 30), // Padding
                                              ),
                                              child: Text(
                                                  'Xem giá đề xuất từ chuyên gia'),
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
                                                  labelText: 'Vị trí',
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
                                                    _originCityController),
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
                                              value: _selectedValue,
                                              decoration: InputDecoration(
                                                labelText: 'Loại đơn hàng',
                                                labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              items: [
                                                'Order',
                                                'PreOrder',
                                              ].map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                // Set the new selected value
                                                setState(() {
                                                  _selectedValue =
                                                      newValue?.trim();
                                                });
                                              },
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
                                // startXrg (3154:3260)
                                padding: EdgeInsets.fromLTRB(
                                    15 * fem, 15 * fem, 15 * fem, 12 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    DropdownButtonFormField<int>(
                                      value: selectedPlantId,
                                      decoration: InputDecoration(
                                        labelText: 'Sản phẩm',
                                        labelStyle: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      items: plantList.map((DataPlant plant) {
                                        return DropdownMenuItem<int>(
                                          value: plant.plantId,
                                          child: Text(plant.plantName ?? ''),
                                        );
                                      }).toList(),
                                      onChanged: (int? plantId) {
                                        setState(() {
                                          selectedPlantId = plantId;
                                          print(
                                              'selectedGardenId: $selectedPlantId');
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25 * fem,
                              ),
                              Container(
                                // startXrg (3154:3260)
                                padding: EdgeInsets.fromLTRB(
                                    15 * fem, 15 * fem, 15 * fem, 12 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    DropdownButtonFormField<int>(
                                      value: selectedCategoryId,
                                      decoration: InputDecoration(
                                        labelText: 'Loại sản phẩm',
                                        labelStyle: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      items: categoryList
                                          .map((CategoryFruit category) {
                                        return DropdownMenuItem<int>(
                                          value: category.categoryFruitId,
                                          child: Text(
                                              category.categoryFruitName ?? ''),
                                        );
                                      }).toList(),
                                      onChanged: (int? categoryFruitId) {
                                        setState(() {
                                          selectedCategoryId = categoryFruitId;
                                          print(
                                              'selectedvarietyId: $selectedCategoryId');
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 25 * fem,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _createPostFruit();
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
              ],
            ),
          ),
        ));
  }
}
