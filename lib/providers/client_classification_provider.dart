import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../configurations/consts/error_codes.dart';
import '../configurations/paths/get_paths.dart';
import '../models/client_classification.dart';
import '../models/result.dart';
import '../models/reterned_response.dart';

class ClientClassificationProvider extends ChangeNotifier {
  final dio = Dio();
  List<ClientClassification> clientClassificationsList = <ClientClassification>[];
  List<ClientClassification> get clientClassifications => clientClassificationsList;

  Future<Result> getClientClassifications() async {
    late ReternedResponse reternedResponse;

    Response<dynamic> response = await dio.post(getClientClassificationUrl);

    Map<dynamic, dynamic> responseBody = jsonDecode(response.data);
    bool statu = responseBody['statu'] == 'success' ? true : false;
    if (statu) {
      List<dynamic> clientClassificationsResponse = responseBody['result'];
      for (Map clientClassification in clientClassificationsResponse) {
        clientClassificationsList.add(ClientClassification.fromJson(clientClassification));
      }
      reternedResponse = ReternedResponse(message: '', state: statu, type: ReternedResponseType.success);
    } else {
      reternedResponse = ReternedResponse(message: ECCGCC300P, state: statu, type: ReternedResponseType.wentWrong);
    }
    notifyListeners();
    return Result(response: reternedResponse);
  }
}
