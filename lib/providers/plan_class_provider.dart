import "dart:convert";

import "package:dio/dio.dart";
import "package:flutter/foundation.dart";

import "../configurations/consts/error_codes.dart";
import "../configurations/paths/get_paths.dart";
import "../models/plan_class.dart";
import "../models/result.dart";
import "../models/reterned_response.dart";

class PlanClassProvider extends ChangeNotifier {
  final dio = Dio();
  List<PlanClass> plansClassList = <PlanClass>[];
  List<PlanClass> get plansClass => plansClassList;

  Future<Result> getPlanClasses() async {
    late ReternedResponse reternedResponse;
    Response<dynamic> response = await dio.post(getPlansClassesUrl);
    Map<dynamic, dynamic> responseBody = jsonDecode(response.data);

    bool statu = responseBody['statu'] == 'success' ? true : false;
    if (statu) {
      List<dynamic> planClassesResponse = responseBody['result'];
      for (Map planClass in planClassesResponse) {
        plansClassList.add(PlanClass.fromJson(planClass));
      }
      reternedResponse = ReternedResponse(message: '', state: statu, type: ReternedResponseType.success);
    } else {
      reternedResponse = ReternedResponse(message: EPCGPC500P, state: statu, type: ReternedResponseType.wentWrong);
    }
    notifyListeners();
    return Result(response: reternedResponse);
  }
}
