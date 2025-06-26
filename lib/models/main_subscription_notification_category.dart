import 'dart:convert' as j;

class MainSubscriptionNotificationCategory {
  late int id;
  late Map<String, dynamic> title;
  late Map<String, dynamic> description;
  late bool state;
  late DateTime timeCreate;

  MainSubscriptionNotificationCategory({
    required this.id,
    required this.title,
    required this.description,
    required this.state,
    required this.timeCreate,
  });

  MainSubscriptionNotificationCategory.fromJson(Map json) {
    id = json['id'];
    title = j.json.decode(json['title']);
    description = j.json.decode(json['description']);
    state = json['state'] == 1 ? true : false;
    timeCreate = DateTime.parse(json['timeCreate'] as String);
  }
}
