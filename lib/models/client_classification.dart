import 'dart:convert' as j;

class ClientClassification {
  late int id;
  late Map<String, dynamic> title;

  ClientClassification({required this.id, required this.title});
  ClientClassification.fromJson(Map json) {
    id = json['id'];
    title = j.json.decode(json['title']);
  }
}
