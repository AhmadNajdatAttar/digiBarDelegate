import 'dart:convert' as j;

class ClientCategory {
  late int id;
  late Map<String, dynamic> title;
  ClientCategory({required this.id, required this.title});

  ClientCategory.fromJson(Map json) {
    id = json['id'];
    title = j.json.decode(json['title']);
  }
}
