import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../configurations/consts/error_codes.dart';
import '../configurations/paths/get_paths.dart';
import '../models/city.dart';
import '../models/result.dart';
import '../models/reterned_response.dart';

class CityProvider extends ChangeNotifier {
  final dio = Dio();
  List<City> citiesList = <City>[];
  List<City> get cities => citiesList;

  Future<Result> getCities({required String clerkId}) async {
    late ReternedResponse reternedResponse;
    FormData data = FormData.fromMap({'clerkId': clerkId});
    Response<dynamic> response = await dio.post(getCitiesUrl, data: data);
    Map<dynamic, dynamic> responseBody = jsonDecode(response.data);
    bool statu = responseBody['statu'] == 'success' ? true : false;

    if (statu) {
      List<dynamic> citiesResponse = responseBody['result'];
      for (Map city in citiesResponse) {
        citiesList.add(City.fromJson(city));
      }
      reternedResponse = ReternedResponse(message: '', state: statu, type: ReternedResponseType.success);
    } else {
      reternedResponse = ReternedResponse(message: ECGC200P, state: statu, type: ReternedResponseType.wentWrong);
    }
    notifyListeners();
    return Result(response: reternedResponse);
  }
}
