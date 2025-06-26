class Country {
  late int id;
  late String name;
  late bool haveTaxAccount;
  late String taxUrl;
  Country({required this.id, required this.name});

  Country.fromJson(Map json) {
    id = json['id'];
    name = json['name'];
    haveTaxAccount = json['haveTaxAccount'] == 0 ? false : true;
    taxUrl = json['taxUrl'];
  }
}
