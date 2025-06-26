import 'dart:convert' as j;

class City {
  late int id;
  late int countryId;
  late Map<String, dynamic> name;
  City({required this.id, required this.countryId, required this.name});

  City.fromJson(Map json) {
    id = json['id'];
    countryId = json['countryId'];
    name = j.json.decode(json['name']);
  }
}
