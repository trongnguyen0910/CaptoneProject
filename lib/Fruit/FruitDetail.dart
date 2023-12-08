import 'dart:convert';

import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/HomeScreen/comment.dart';
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/CommentController.dart';
import '../Controller/DataFruitController.dart';
import 'package:http/http.dart' as http;

import '../Controller/ReviewFruitController.dart';
import 'AddDiscount.dart';
import 'PostImageFruit.dart';

class FruitDetail extends StatefulWidget {
  final DataFruit fruit;
  const FruitDetail({Key? key, required this.fruit}) : super(key: key);

  @override
  State<FruitDetail> createState() => _FruitDetailState();
}

class _FruitDetailState extends State<FruitDetail> {
   final _commentController = TextEditingController();
       final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();
    getComment(widget.fruit.fruitId!);
  }

  List<DataReviewFruit> datacomment = [];
  Future<void> getComment(int fruitId) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/review-fruits?activeOnly=true&fruitId=$fruitId';
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
          datacomment = responseTrans
              .map((item) => DataReviewFruit.fromJson(item))
              .toList();
        });
      }
    }
  }
   Future<void> _createPostComment() async {
  final prefs = await SharedPreferences.getInstance();
  final accountID = prefs.getInt('accountID');
  final accessToken = prefs.getString('accessToken');
  var comment = _commentController.text;
  var fruitID = widget.fruit.fruitId.toString();
  var userId = accountID;

  var url = 'https://fruitseasonms.azurewebsites.net/api/review-fruits';
  var request = http.MultipartRequest('POST', Uri.parse(url));

  request.headers.addAll({
    'Authorization': 'Bearer $accessToken',
  });

  request.fields['ReviewComment'] = comment;
  request.fields['Rating'] = '5';
  request.fields['FruitId'] = fruitID;
  request.fields['ParentId'] = '0';
  request.fields['UserId'] = userId.toString();
  request.fields['UploadFile'] = '';

  try {
    var response = await request.send();
    var statusCode = response.statusCode;
    print('Status code: $statusCode');

    if (statusCode == 200) {
      _commentController.clear();
      FocusScope.of(context).unfocus();
    } else {
      var responseString = await response.stream.bytesToString();
      var responseBody = json.decode(responseString);
      var errorMessage = responseBody['errors'];
      String errorContent = errorMessage.toString();
    }
  } catch (e) {
    print('Exception: $e');
  }
}
  Future<void> _refresh() async {
    // Implement the logic to refresh comments
    await getComment(widget.fruit.fruitId!);
  }
  @override
  Widget build(BuildContext context) {
    bool showAddDiscountButton = widget.fruit.orderType == "PreOrder";
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin chi tiết sản phẩm',
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
       body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10 * fem),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PostImageFruit(fruitId: widget.fruit.fruitId!)),
                  );
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 19 * fem),
                  child: Container(
                    height: 250 * fem,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: widget.fruit.fruitImages?.isNotEmpty == true
                            ? NetworkImage(
                                widget.fruit.fruitImages![0].imageUrl!)
                            : AssetImage('assets/mobile/images/add-image.png')
                                as ImageProvider,
                      ),
                    ),
                  ),
                ),
              ),

              Text(
                '${widget.fruit.fruitName}',
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 30 * ffem,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
              ),
              SizedBox(height: 15 * fem),
              Text(
                '${widget.fruit.fruitDescription}',
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000),
                ),
              ),
              SizedBox(height: 20 * fem),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Giá hàng',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                      ),
                      Text(
                        '${widget.fruit.price}',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 15 * ffem,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 229, 163, 22),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nơi sản xuất',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                      ),
                      Text(
                        '${widget.fruit.originCity}',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 229, 163, 22),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Số lượng hàng',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                      ),
                      Text(
                        '${widget.fruit.quantityAvailable}',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 15 * ffem,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 229, 163, 22),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20 * fem),
              // Comments section - ListView
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: datacomment.length,
                itemBuilder: (context, index) {
                  return Comment(
                    fullName: datacomment[index].fullName,
                    commentContent: datacomment[index].reviewComment,
                  );
                },
              ),
               Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _commentController,
                        decoration: InputDecoration(
                          hintText: 'Viết bình luận...',
                          border: InputBorder.none,
                        ),
                        maxLines: 3,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        _createPostComment();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
       ),
      floatingActionButton: showAddDiscountButton
          ? Stack(
              children: [
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: NeumorphicButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddDiscount(fruitId: widget.fruit.fruitId!),
                        ),
                      );
                    },
                    style: NeumorphicStyle(
                      color: Color(0xff6cc51d),
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10)),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 20 * fem, horizontal: 20 * fem),
                    child: Text(
                      'Thêm giảm giá',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : null,
    );
  }
}
