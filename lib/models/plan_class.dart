import 'dart:convert' as j;

class PlanClass {
  late int id;
  late Map<String, dynamic> title;
  late bool state;
  late String image;
  late Map<String, dynamic> description;

  PlanClass({
    required this.id,
    required this.title,
    required this.state,
    required this.image,
    required this.description,
  });
  PlanClass.fromJson(Map json) {
    id = json['id'];
    title = j.json.decode(json['description']);
    state = json['state'] == '1' ? true : false;
    image = json['image'];
    description = j.json.decode(json['description']);
  }
}
