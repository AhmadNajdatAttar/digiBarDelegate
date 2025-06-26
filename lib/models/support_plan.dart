class SupportPlan {
  final int id;
  final int planId;
  final int durationId;
  final Map<String, String> title;
  final int length;
  final DateTime timeCreate;
  final bool state;
  final double cost;
  final String image;
  final Map<String, String> description;

  SupportPlan({
    required this.id,
    required this.planId,
    required this.durationId,
    required this.title,
    required this.length,
    required this.timeCreate,
    required this.state,
    required this.cost,
    required this.image,
    required this.description,
  });
}
