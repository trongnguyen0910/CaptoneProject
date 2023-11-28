import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Controller/DataPostController.dart';
import 'PostObject.dart';
import 'ViewPostExpertDetail.dart';
import '../model/GardenModel.dart';
import '../HomeScreen/Home.dart';

class ViewPost extends StatefulWidget {
  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  List<DataPost> datapost = [];
  String searchText = '';

  @override
  void initState() {
    super.initState();
    getPost();
  }

   Future<void> getPost() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/posts?activeOnly=true';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final responseTrans = json.decode(response.body)['data'];
    var statusCode = response.statusCode;
    print('Status code Fruit: $statusCode');
    if (responseTrans != null) {
      if (responseTrans is List) {
        setState(() {
          datapost =
              responseTrans.map((item) => DataPost.fromJson(item)).toList();
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    List<DataPost> filteredTrans = datapost.where((item) {
      return item.postTitle!.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        title: Text('Post List', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
         onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                searchText = '';
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search...',
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300.0,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              itemCount: filteredTrans.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PostDetail(datapost: datapost[index]),
                      ),
                    );
                  },
                  child: PostObject(
                    fullName: filteredTrans[index].fullName,
                    type: filteredTrans[index].type,
                    postContent: filteredTrans[index].postContent,
                    postImage: filteredTrans[index].postImage,
                    postTitle: filteredTrans[index].postTitle,
                    press: () {},
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
