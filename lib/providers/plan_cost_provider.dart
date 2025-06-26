import "dart:convert";
import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "../configurations/consts/error_codes.dart";
import "../configurations/paths/get_paths.dart";
import "../models/plan_cost.dart";
import "../models/result.dart";
import "../models/reterned_response.dart";

class PlanCostProvider extends ChangeNotifier {
  final dio = Dio();
  List<PlanCost> plansCostsList = <PlanCost>[];
  List<PlanCost> get plansCosts => plansCostsList;

  Future<Result> getPlansCosts() async {
    late ReternedResponse reternedResponse;
    Response<dynamic> response = await dio.post(getPlanCostsUrl);
    Map<dynamic, dynamic> responseBody = jsonDecode(response.data);

    bool statu = responseBody['statu'] == 'success' ? true : false;
    if (statu) {
      List<dynamic> planCostsResponse = responseBody['result'];
      for (Map planCost in planCostsResponse) {
        plansCostsList.add(PlanCost.fromJson(planCost));
      }
      reternedResponse = ReternedResponse(message: '', state: statu, type: ReternedResponseType.success);
    } else {
      reternedResponse = ReternedResponse(message: EPCGPC800P, state: statu, type: ReternedResponseType.wentWrong);
    }
    notifyListeners();
    return Result(response: reternedResponse);
  }
}
