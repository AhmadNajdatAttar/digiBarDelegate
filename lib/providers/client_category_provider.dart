import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../configurations/consts/error_codes.dart';
import '../configurations/paths/get_paths.dart';
import '../models/client_category.dart';
import '../models/result.dart';
import '../models/reterned_response.dart';

class ClientCategoryProvider extends ChangeNotifier {
  final dio = Dio();
  List<ClientCategory> clientCategoriesList = <ClientCategory>[];
  List<ClientCategory> get clientCategories => clientCategoriesList;

  Future<Result> getClientCategories() async {
    late ReternedResponse reternedResponse;

    Response<dynamic> response = await dio.post(getClientCategoryUrl);
    Map<dynamic, dynamic> responseBody = jsonDecode(response.data);
    bool statu = responseBody['statu'] == 'success' ? true : false;

    if (statu) {
      List<dynamic> clientCategoriesResponse = responseBody['result'];
      for (Map clientCategory in clientCategoriesResponse) {
        clientCategoriesList.add(ClientCategory.fromJson(clientCategory));
      }
      reternedResponse = ReternedResponse(message: '', state: statu, type: ReternedResponseType.success);
    } else {
      reternedResponse = ReternedResponse(message: ECCGCC400P, state: statu, type: ReternedResponseType.wentWrong);
    }
    notifyListeners();
    return Result(response: reternedResponse);
  }
}
