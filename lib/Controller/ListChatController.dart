class ListChats {
  List<Data>? data;

  ListChats({this.data});

  ListChats.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? sender;
  int? receiver;
  String? message;
  String? sendTimeOnUtc;

  Data({this.id, this.sender, this.receiver, this.message, this.sendTimeOnUtc});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sender = json['sender'];
    receiver = json['receiver'];
    message = json['message'];
    sendTimeOnUtc = json['sendTimeOnUtc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sender'] = sender;
    data['receiver'] = receiver;
    data['message'] = message;
    data['sendTimeOnUtc'] = sendTimeOnUtc;
    return data;
  }
}
