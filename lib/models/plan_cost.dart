class PlanCost {
  late int id;
  late int planClassId;
  late int durationId;
  late int coinId;
  late double cost;
  late bool state;

  PlanCost({
    required this.id,
    required this.planClassId,
    required this.durationId,
    required this.coinId,
    required this.cost,
    required this.state,
  });
  PlanCost.fromJson(Map json) {
    id = json['id'];
    planClassId = json['planClassId'];
    durationId = json['durationId'];
    coinId = json['coinId'];
    cost = double.parse(json['cost'].toString());
    state = json['state'] == '1' ? true : false;
  }
}
