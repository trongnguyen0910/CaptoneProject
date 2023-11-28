import 'dart:convert';

import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/HomeScreen/comment.dart';
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/CommentController.dart';
import '../Controller/DataFruitController.dart';
import 'package:http/http.dart' as http;

import '../Controller/DataPostController.dart';
import '../Controller/ReviewFruitController.dart';

class PostDetail extends StatefulWidget {
  final DataPost datapost;
  const PostDetail({Key? key, required this.datapost}) : super(key: key);

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  final _commentController = TextEditingController();
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  
  @override
  void initState() {
    super.initState();
    getComment(widget.datapost.postId!);
  }

  List<DataComment> datacomment = [];
  Future<void> getComment(int postID) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/comments?activeOnly=false&postId=$postID';
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
              responseTrans.map((item) => DataComment.fromJson(item)).toList();
        });
      }
    }
  }
  
  Future<void> _refresh() async {
    // Implement the logic to refresh comments
    await getComment(widget.datapost.postId!);
  }

  _createPostComment() async {
  final prefs = await SharedPreferences.getInstance();
  final accountID = prefs.getInt('accountID');
  final accessToken = prefs.getString('accessToken');
  var comment = _commentController.text;
  var postID = widget.datapost.postId.toString();
  var userId = accountID;
  var url = 'https://fruitseasonms.azurewebsites.net/api/comments';

  var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $accessToken',
  };

  var data = {
    'commentContent': comment,
    'postId': postID,
    'parentId': 0,
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
      // Clear the text field
      _commentController.clear();
      FocusScope.of(context).unfocus();
      // Update the UI with the new comment
   
    } else if (response.statusCode != 200) {
      var responseString = response.body;
      var responseBody = json.decode(responseString);
      var errorMessage = responseBody['errors'];
      String errorContent = errorMessage.toString();
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin bài đăng chuyên gia',
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
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 19 * fem),
                child: Container(
                  height: 250 * fem,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(widget.datapost.postImage!),
                    ),
                  ),
                ),
              ),
              Text(
                '${widget.datapost.postTitle}',
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 30 * ffem,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff000000),
                ),
              ),
              SizedBox(height: 15 * fem),
               Html(
                  data: '${widget.datapost.postContent}',
                ),
              SizedBox(height: 20 * fem),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Full Name',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                      ),
                      Text(
                        '${widget.datapost.fullName}',
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Type',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                      ),
                      Text(
                        '${widget.datapost.type}',
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
                    commentContent: datacomment[index].commentContent,
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
                        controller: _commentController,
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
       )
    );
  }
}
