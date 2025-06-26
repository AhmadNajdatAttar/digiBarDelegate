class Clerk {
  late int id;
  late int userId;
  late String username;
  late int clerkTypeId;
  late int cityId;
  late bool blocked;
  late String image;

  Clerk({
    required this.id,
    required this.userId,
    required this.username,
    required this.clerkTypeId,
    required this.cityId,
    required this.blocked,
    required this.image,
  });

  Clerk.fromJson(Map json) {
    id = json['id'];
    userId = json['userId'];
    username = json['username'];
    clerkTypeId = json['clerkTypeId'];
    cityId = json['cityId'];
    blocked = json['blocked'];
    image = json['image'];
  }
}
