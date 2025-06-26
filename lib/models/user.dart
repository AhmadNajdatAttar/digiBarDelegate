class User {
  late int id;
  late int userId;
  late String username;
  late String token;
  late int clerkTypeId;
  late bool state;
  late int cityId;
  late DateTime startWorkDateTime;
  late bool blocked;
  late String image;

  User({
    required this.id,
    required this.userId,
    required this.username,
    required this.token,
    required this.clerkTypeId,
    required this.state,
    required this.cityId,
    required this.startWorkDateTime,
    required this.blocked,
    required this.image,
  });
  User.fromJson(Map json) {
    id = json['id'];
    userId = json['userId'];
    username = json['username'];
    token = json['token'];
    clerkTypeId = json['clerkTypeId'];
    state = json['state'] == 1 ? true : false;
    cityId = json['cityId'];
    startWorkDateTime = DateTime.parse(json['startWorkDateTime']);
    blocked = json['blocked'] == 1 ? true : false;
    image = json['image'];
  }
}
