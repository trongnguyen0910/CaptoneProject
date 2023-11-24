import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/WeatherController.dart';
import 'WeatherObject.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Future<WeatherResponse> futureWeather;
  CancelableOperation? cancelableOperation;
  late ScrollController _controller;
  late TextEditingController controllerSearchField = TextEditingController();
 String searchText = '';

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    futureWeather = fetchWeather(controllerSearchField.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Dự báo thời tiết',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            height: 4.0,
            color: Colors.grey.shade100,
          ),
          Container(
            color: Colors.white,
            child: TextFormField(
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyMedium,
              cursorColor: Colors.black,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  cancelableOperation?.cancel();
                  cancelableOperation = CancelableOperation.fromFuture(
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      setState(() {
                        futureWeather = fetchWeather(value);
                      });
                    }),
                  );
                }
              },
              controller: controllerSearchField,
              keyboardType: TextInputType.text,
              obscureText: false,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search_sharp,
                  size: 32.0,
                  color: Colors.black,
                ),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 10.0),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.zero),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: 'Nhập địa điểm...',
                hintStyle: TextStyle(color: Colors.grey.shade700),
              ),
            ),
          ),
          Container(
            height: 4.0,
            color: Colors.grey.shade100,
          ),
          Expanded(
            child: Container(
              color: Colors.grey.shade50,
              child: FutureBuilder<WeatherResponse>(
                  future: futureWeather,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Data> datas = snapshot.data!.data ?? [];
                      return ListView.builder(
                          controller: _controller, //new line
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: datas.length,
                          itemBuilder: (context, index) {
                            return WeatherObject(
                              weather: datas[index],
                            );
                            // return Text(datas[index].weatherName ?? '');
                          });
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const Expanded(
                      child: Center(
                          child: SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator())),
                    );
                  }),
            ),
          )
        ],
      )),
    );
  }
}

Future<WeatherResponse> fetchWeather(String query) async {
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString('accessToken');
  final response = await http.get(
      Uri.parse(
          'https://fruitseasonapims-001-site1.btempurl.com/api/weathers?location=$query'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      });

  if (response.statusCode == 200) {
    return WeatherResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}
