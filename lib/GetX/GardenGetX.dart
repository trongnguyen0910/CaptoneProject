import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Controller/GardenController.dart';
import '../Controller/PlantController.dart';
import 'package:http/http.dart' as http;

import '../Controller/VarietyController.dart';


class GardenController extends GetxController {
  var gardenList = <DataGarden>[].obs;
   var plantList = <DataPlant>[].obs;
   var varietyList = <DataVariety>[].obs;
   var datagarden = [].obs; 
   
  void updateGardenList(List<DataGarden> newList) {
    gardenList.value = newList;
  }
  void updatePlantList(List<DataPlant> newList) {
    plantList.value = newList;
  }
  void updateVarietyList(List<DataVariety> newList) {
    varietyList.value = newList;
  }
  Future<void> fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url = 'http://fruitseasonapims-001-site1.btempurl.com/api/gardens?activeOnly=true';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
       var statusCode = response.statusCode;
    print('Status code Garden: $statusCode');
      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body)['data'];
        if (responseData.isNotEmpty) {
          List<DataGarden> gardenData = responseData.map((item) => DataGarden.fromJson(item)).toList();
          datagarden.assignAll(gardenData); // Cập nhật dữ liệu datagarden
        }
      } else {
        // Xử lý khi không thành công
        // Ví dụ: Log lỗi, hiển thị thông báo lỗi, vv.
      }
    } catch (e) {
      // Xử lý khi có lỗi Exception
    }
  }
}