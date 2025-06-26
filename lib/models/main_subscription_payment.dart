import 'dart:io';

class ManiSubscriptionPayment {
  int? id = 0;
  int? mainSubscriptionId = 0;
  String? checkImage = '';
  DateTime? timeCreate = DateTime.now();
  bool? cancelled = false;
  bool? subscriptionSeen = false;
  bool? adminSeen = false;
  bool? subscriptionConfirm = false;
  bool? admineConfirmCancelled = false;
  bool? admineSeenCancelled = false;
  DateTime? cancelledTimeCreate = DateTime.now();
  File? imageFile;

  ManiSubscriptionPayment({
    this.id,
    this.mainSubscriptionId,
    this.checkImage,
    this.timeCreate,
    this.cancelled,
    this.subscriptionSeen,
    this.adminSeen,
    this.subscriptionConfirm,
    this.admineConfirmCancelled,
    this.admineSeenCancelled,
    this.cancelledTimeCreate,
    this.imageFile,
  });
}
