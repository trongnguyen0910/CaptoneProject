class WeatherResponse {
  List<Data>? data;

  WeatherResponse({this.data});

  WeatherResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? weatherId;
  String? weatherName;
  String? fullName;
  String? location;
  String? image;
  String? description;
  String? status;
  String? createdDate;

  Data(
      {this.weatherId,
      this.weatherName,
      this.fullName,
      this.location,
      this.image,
      this.description,
      this.status,
      this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
    weatherId = json['weatherId'];
    weatherName = json['weatherName'];
    fullName = json['fullName'];
    location = json['location'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['weatherId'] = weatherId;
    data['weatherName'] = weatherName;
    data['fullName'] = fullName;
    data['location'] = location;
    data['image'] = image;
    data['description'] = description;
    data['status'] = status;
    data['createdDate'] = createdDate;
    return data;
  }
}
