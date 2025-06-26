import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// Replace these imports with your actual model and response classes
import '../configurations/consts/error_codes.dart';
import '../configurations/paths/get_paths.dart';
import '../models/main_subscription_notification_category.dart';
import '../models/result.dart';
import '../models/reterned_response.dart';

class MainSubscriptionNotificationCategoryProvider extends ChangeNotifier {
  final dio = Dio();
  List<MainSubscriptionNotificationCategory> categoriesList = <MainSubscriptionNotificationCategory>[];
  List<MainSubscriptionNotificationCategory> get categories => categoriesList;

  Future<Result> getCategories() async {
    late ReternedResponse returnedResponse;
    Response<dynamic> response = await dio.post(getMainSubscriptionNotificationCategoriesUrl);
    Map<dynamic, dynamic> responseBody = jsonDecode(response.data);
    bool status = responseBody['status'] == 'success';

    if (status) {
      List<dynamic> categoriesResponse = responseBody['result'];
      for (Map cat in categoriesResponse) {
        categoriesList.add(MainSubscriptionNotificationCategory.fromJson(cat));
      }
      returnedResponse = ReternedResponse(
        message: '',
        state: status,
        type: ReternedResponseType.success,
      );
    } else {
      returnedResponse = ReternedResponse(
        message: ENMSNC2000P,
        state: status,
        type: ReternedResponseType.wentWrong,
      );
    }
    notifyListeners();
    return Result(response: returnedResponse);
  }
}
