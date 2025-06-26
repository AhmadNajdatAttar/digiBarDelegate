import 'dart:convert' as j;

class Coin {
  late int id;
  late int countryId;
  late Map<String, dynamic> name;
  late String icon;

  Coin({
    required this.id,
    required this.countryId,
    required this.name,
    required this.icon,
  });

  Coin.fromJson(Map json) {
    id = json['id'];
    countryId = json['countryId'];
    name = j.json.decode(json['name']);
    icon = json['icon'];
  }
}
