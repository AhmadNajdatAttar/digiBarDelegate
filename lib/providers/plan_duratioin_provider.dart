import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../configurations/consts/error_codes.dart';
import '../configurations/paths/get_paths.dart';
import '../models/plan_duration.dart';
import '../models/result.dart';
import '../models/reterned_response.dart';

class PlanDurationProvider extends ChangeNotifier {
  final dio = Dio();
  List<PlanDuration> planDurationsList = <PlanDuration>[];
  List<PlanDuration> get planDurations => planDurationsList;

  Future<Result> getPlanDurations() async {
    late ReternedResponse reternedResponse;
    Response<dynamic> response = await dio.post(getPlansDurationsUrl);
    Map<dynamic, dynamic> responseBody = jsonDecode(response.data);
    bool statu = responseBody['statu'] == 'success' ? true : false;

    if (statu) {
      List<dynamic> planDurationsResponse = responseBody['result'];
      for (Map planDuration in planDurationsResponse) {
        planDurationsList.add(PlanDuration.fromJson(planDuration));
      }
      reternedResponse = ReternedResponse(message: '', state: statu, type: ReternedResponseType.success);
    } else {
      reternedResponse = ReternedResponse(message: EPDGPD600P, state: statu, type: ReternedResponseType.wentWrong);
    }
    notifyListeners();
    return Result(response: reternedResponse);
  }
}
