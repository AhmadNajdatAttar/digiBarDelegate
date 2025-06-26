import 'dart:convert' as j;

class PaymentCategory {
  late int id;
  late Map<String, dynamic> title;

  PaymentCategory({
    required this.id,
    required this.title,
  });
  PaymentCategory.fromJson(Map json) {
    id = json['id'];
    title = j.json.decode(json['title']);
  }
}
