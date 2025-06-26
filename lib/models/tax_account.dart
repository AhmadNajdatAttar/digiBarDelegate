class TaxAccount {
  late int? id;
  late int? subscriptionId;
  late String? number;
  late String? userName;
  late String? password;
  late DateTime? timeCreate;

  TaxAccount(
      {required this.id,
      required this.subscriptionId,
      required this.number,
      required this.userName,
      required this.password,
      required this.timeCreate});
}
