import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/support_plan.dart';

class SupportPlanProvider extends ChangeNotifier {
  final dio = Dio();
  List<SupportPlan> supportPlansList = <SupportPlan>[
    SupportPlan(
        id: 1,
        planId: 1,
        durationId: 1,
        title: {'en': 'Silver plan', 'ar': 'الخطة الفضي'},
        length: 12,
        timeCreate: DateTime.now(),
        state: true,
        cost: 2500,
        image: '',
        description: {'en': 'Silver plan', 'ar': 'الخطة الفضي'}),
    SupportPlan(
        id: 2,
        planId: 2,
        durationId: 1,
        title: {'en': 'Golden plan', 'ar': 'الخطة الذهبية'},
        length: 12,
        timeCreate: DateTime.now(),
        state: true,
        cost: 4500,
        image: '',
        description: {'en': 'Golden plan', 'ar': 'الخطة الذهبية'}),
    SupportPlan(
        id: 3,
        planId: 3,
        durationId: 3,
        title: {'en': 'Diamond plan', 'ar': 'الخطة الماسية'},
        length: 12,
        timeCreate: DateTime.now(),
        state: true,
        cost: 8000,
        image: '',
        description: {'en': 'Diamond plan', 'ar': 'الخطة الماسية'})
  ];
  List<SupportPlan> get supportPlans => supportPlansList;

  // Future getSupportPlans() async {
  //   Response<dynamic> response = await dio.post(getCitiesUrl);
  //   Map<dynamic, dynamic> responseBody = jsonDecode(response.data);
  //   List<dynamic> supportPlansResponse = responseBody['result'];
  //   for (SupportPlan supportPlan in supportPlansResponse) {}
  // }
}
