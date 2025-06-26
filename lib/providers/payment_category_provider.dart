import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../configurations/consts/error_codes.dart';
import '../configurations/paths/get_paths.dart';
import '../models/payment_category.dart';
import '../models/result.dart';
import '../models/reterned_response.dart';

class PaymentCategoryProvider extends ChangeNotifier {
  final dio = Dio();
  List<PaymentCategory> paymentCategoriesList = <PaymentCategory>[];
  List<PaymentCategory> get paymentCategories => paymentCategoriesList;

  Future<Result> getPaymentCategories() async {
    late ReternedResponse result;
    Response<dynamic> response = await dio.post(getPaymentCategoriesUrl);
    Map<dynamic, dynamic> responseBody = jsonDecode(response.data);
    bool statu = responseBody['statu'] == 'success' ? true : false;

    if (statu) {
      List<dynamic> paymentCategoryResponse = responseBody['result'];
      for (Map paymentCategory in paymentCategoryResponse) {
        paymentCategoriesList.add(PaymentCategory.fromJson(paymentCategory));
      }
      result = ReternedResponse(message: '', state: statu, type: ReternedResponseType.success);
    } else {
      result = ReternedResponse(message: EPCGPC900P, state: statu, type: ReternedResponseType.wentWrong);
    }
    notifyListeners();
    return Result(response: result);
  }
}
