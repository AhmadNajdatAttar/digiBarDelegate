class SubscriptiodnForm {
  final String? clientName;
  final String? clientAddress;
  final String? ownerFullName;
  final String? ownerPhoneNumber;
  final String? managerFullName;
  final String? managerPhoneNumber;
  final int? clientCountry;
  final int? clientCity;
  final int? clientCategory;
  final int? clientClassification;
  final String? clientCoordinatesLat;
  final String? clientCoordinatesLong;
  final bool taxAccountRequired;
  final bool taxSynchronizationRequired;
  final int? subscriptionPlan;
  final int? supportPlan;

  SubscriptiodnForm({
    required this.clientName,
    required this.clientAddress,
    required this.ownerFullName,
    required this.ownerPhoneNumber,
    required this.managerFullName,
    required this.managerPhoneNumber,
    required this.clientCountry,
    required this.clientCity,
    required this.clientCategory,
    required this.clientClassification,
    required this.clientCoordinatesLat,
    required this.clientCoordinatesLong,
    required this.taxAccountRequired,
    required this.taxSynchronizationRequired,
    required this.subscriptionPlan,
    required this.supportPlan,
  });
}
