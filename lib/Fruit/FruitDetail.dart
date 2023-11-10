import 'dart:convert';

import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/HomeScreen/comment.dart';
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/CommentController.dart';
import '../Controller/DataFruitController.dart';
import 'package:http/http.dart' as http;

import '../Controller/ReviewFruitController.dart';

class FruitDetail extends StatefulWidget {
  final DataFruit fruit;
  const FruitDetail({Key? key, required this.fruit}) : super(key: key);

  @override
  State<FruitDetail> createState() => _FruitDetailState();
}

class _FruitDetailState extends State<FruitDetail> {
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
        'https://fruitseasonapims-001-site1.btempurl.com/api/review-fruits?activeOnly=true&fruitId=$fruitId';
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
          datacomment =
              responseTrans.map((item) => DataReviewFruit.fromJson(item)).toList();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
    body: SingleChildScrollView(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10 * fem),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 19 * fem),
              child: Container(
                height: 250 * fem,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.fruit.fruitImages![0].imageUrl!),
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
            // Input for adding comments
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
                      decoration: InputDecoration(
                        hintText: 'Write your comment...',
                        border: InputBorder.none,
                      ),
                      maxLines: 3,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      
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
  );
}

}
