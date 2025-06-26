import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../configurations/consts/error_codes.dart';
import '../configurations/paths/get_paths.dart';
import '../models/main_subscription.dart';
import '../models/result.dart';
import '../models/reterned_response.dart';
import '../models/tax_account.dart';

class NewMainSubscriptionProvider extends ChangeNotifier {
  final dio = Dio();

  late MainSubscription mainSubscriptionObject;

  MainSubscription get mainSubscription => mainSubscriptionObject;

  double newSubscriptionProgressValue = 0;
  double get newSubscriptionProgress => newSubscriptionProgressValue;

  Future<Result> newSubscription({required MainSubscription mainSubscription}) async {
    late ReternedResponse reternedResponse;
    newSubscriptionProgressValue = 0;
    notifyListeners();
    List<Map<String, Object?>> hallsAndTaxs = [];
    for (int h = 0; h < mainSubscription.halls.length; h++) {
      TaxAccount tax = mainSubscription.taxAccounts.firstWhere((t) => t.id == mainSubscription.halls[h].taxAccountId);
      hallsAndTaxs.add({
        "id": mainSubscription.halls[h].id,
        "taxAccountId": mainSubscription.halls[h].taxAccountId,
        "hallName": mainSubscription.halls[h].hallName,
        "requiredTaxAccount": mainSubscription.taxAccountRequired,
        "approveClerkId": mainSubscription.clerkId,
        "number": tax.number,
        "userName": tax.userName,
        "password": tax.password,
      });
    }

    FormData data = FormData.fromMap({
      'clerkId': mainSubscription.clerkId.toString(),
      'clientName': mainSubscription.client.title,
      'clientAddress': mainSubscription.client.address,
      'ownerFullName': mainSubscription.client.ownerFullName,
      'ownerPhoneNumber': mainSubscription.client.ownerPhoneNumber,
      'managerFullName': mainSubscription.client.managerFullName,
      'managerPhoneNumber': mainSubscription.client.managerPhoneNumber,
      'clientCategory': mainSubscription.client.clientCategoryId.toString(),
      'clientClassification': mainSubscription.client.clientClassificationId.toString(),
      'clientCity': mainSubscription.client.cityId.toString(),
      'subscriptionPlan': mainSubscription.planCost.id.toString(),
      'taxAccountRequired': mainSubscription.taxAccountRequired ? '1' : '0',
      'taxSynchronizationRequired': mainSubscription.taxSynchronizationRequired ? '1' : '0',
      'clientCoordinatesLat': mainSubscription.client.latitude.toString(),
      'clientCoordinatesLong': mainSubscription.client.longitude.toString(),
      'expireDateTime': mainSubscription.expireDateTime.toString(),
      'hallsAndTaxs': jsonEncode(hallsAndTaxs),
      'checkImage': await MultipartFile.fromFile(mainSubscription.maniSubscriptionPayment.imageFile!.path),
    });

    Response<dynamic> response = await dio.post(
      newSubscriptionUrl,
      data: data,
      onSendProgress: (sent, all) {
        newSubscriptionProgressValue = ((sent * 100) / all);
        notifyListeners();
      },
    );

    Map<dynamic, dynamic> responseBody = await jsonDecode(response.data);
    bool statu = responseBody['statu'] == 'success' ? true : false;

    if (statu) {
      mainSubscriptionObject = mainSubscription;
      mainSubscriptionObject.id = int.parse(responseBody['subscriptionId']);
      mainSubscriptionObject.clientId = int.parse(responseBody['clientId']);
      mainSubscriptionObject.client.id = int.parse(responseBody['clientId']);
      mainSubscriptionObject.serialKey = responseBody['serialKey'];
      mainSubscriptionObject.maniSubscriptionPayment.id = int.parse(responseBody['mainSubscriptionPaymentId']);
      for (var j = 0; j < responseBody['taxAndHallIds'].length; j++) {
        for (var i = 0; i < mainSubscriptionObject.halls.length; i++) {
          if (responseBody['taxAndHallIds'][j]['hallName'] == mainSubscriptionObject.halls[i].hallName) {
            mainSubscriptionObject.taxAccounts
                .firstWhere((t) => t.number == responseBody['taxAndHallIds'][j]['taxNumber']);
            mainSubscriptionObject.halls[i].id = int.parse(responseBody['taxAndHallIds'][j]['hallId']);
            mainSubscriptionObject.halls[i].taxAccountId = int.parse(responseBody['taxAndHallIds'][j]['taxAccountId']);
          }
        }
      }

      reternedResponse = ReternedResponse(message: '', state: statu, type: ReternedResponseType.success);
    } else {
      reternedResponse = ReternedResponse(
          message: ENSNS1000P + responseBody['message'], state: statu, type: ReternedResponseType.wentWrong);
    }
    notifyListeners();
    return Result(response: reternedResponse, result: mainSubscriptionObject);
  }
}
