class Hall {
  late int? id;
  late int? subscriptionId;
  late int? taxAccountId;
  late String? hallName;
  late bool? state;
  late bool? requiredTaxAccount;
  late int? approveClerkId;
  late DateTime? timeCreate;

  Hall({
    required this.id,
    required this.subscriptionId,
    required this.taxAccountId,
    required this.hallName,
    required this.state,
    required this.requiredTaxAccount,
    required this.approveClerkId,
    required this.timeCreate,
  });
}
