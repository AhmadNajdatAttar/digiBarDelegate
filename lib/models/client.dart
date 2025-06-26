class Client {
  late int id = 0;
  late int clientCategoryId = 0;
  late int clientClassificationId = 0;
  late int clerkId = 0;
  late int cityId = 0;
  late String title = '';
  late String address = '';
  late double longitude = 0;
  late double latitude = 0;
  late String ownerFullName = '';
  late String ownerPhoneNumber = '';
  late String managerFullName = '';
  late String managerPhoneNumber = '';
  late DateTime timeCreate = DateTime.now();
  late bool state = true;

  Client({
    required this.id,
    required this.clientCategoryId,
    required this.clientClassificationId,
    required this.clerkId,
    required this.cityId,
    required this.title,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.ownerFullName,
    required this.ownerPhoneNumber,
    required this.managerFullName,
    required this.managerPhoneNumber,
    required this.timeCreate,
    required this.state,
  });
}
