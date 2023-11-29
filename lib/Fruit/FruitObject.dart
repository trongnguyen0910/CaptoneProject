import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stroke_text/stroke_text.dart';

import '../Controller/DataFruitController.dart';
import 'package:http/http.dart' as http;

import 'ViewFruit.dart';

class FruitObject extends StatefulWidget {
  String? fruitName;
  double? price;
  double? quantityAvailable;
  List<FruitImage>? fruitImages;
  int? fruitId;
  final VoidCallback press;

  FruitObject({
    required this.fruitName,
    required this.price,
    required this.quantityAvailable,
    required this.fruitImages,
    required this.fruitId,
    required this.press,
  });

  @override
  State<FruitObject> createState() => _FruitObjectState();
}

class _FruitObjectState extends State<FruitObject> {
  Future<void> deleteFruit(int fruitId) async {
    print('fruitId: $fruitId');
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/fruits/farmer/$fruitId';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.delete(Uri.parse(url), headers: headers);
    var statusCode = response.statusCode;
    print('Delete success: $statusCode');
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 600;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10 * fem),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150 * fem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: widget.fruitImages != null &&
                                widget.fruitImages!.isNotEmpty
                            ? NetworkImage('${widget.fruitImages![0].imageUrl}')
                            : AssetImage('assets/mobile/images/add-image.png')
                                as ImageProvider,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10 * fem),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.fruitName}',
                          style: TextStyle(
                            fontSize: 25 * ffem,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10 * fem),
                        Text(
                          'Giá: ${widget.price!.toStringAsFixed(3)} vnđ',
                          style: TextStyle(
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10 * fem),
                        Text(
                          'Số lượng: ${widget.quantityAvailable}',
                          style: TextStyle(
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10 * fem,
              right: 10 * fem,
              child: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () async {
                  // Show a confirmation dialog
                  bool confirm = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirm Deletion'),
                        content:
                            Text('Are you sure you want to delete this fruit?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text('Delete'),
                          ),
                        ],
                      );
                    },
                  );
                  if (confirm == true) {
                    deleteFruit(widget.fruitId!);
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (BuildContext context) => ViewFruit()),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
