import 'dart:convert' as j;

class PlanDuration {
  late int id;
  late int type;
  late Map<String, dynamic> title;
  late bool state;
  PlanDuration({
    required this.id,
    required this.type,
    required this.title,
    required this.state,
  });

  PlanDuration.fromJson(Map json) {
    id = json['id'];
    type = json['type'];
    title = j.json.decode(json['title']);
    state = json['state'] == '1' ? true : false;
  }
}
