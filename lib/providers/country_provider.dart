import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../configurations/consts/error_codes.dart';
import '../configurations/paths/get_paths.dart';
import '../models/country.dart';
import '../models/result.dart';
import '../models/reterned_response.dart';

class CountryProvider extends ChangeNotifier {
  final dio = Dio();
  List<Country> countriesList = <Country>[];
  List<Country> get countries => countriesList;

  Future<Result> getCountries({required String clerkId}) async {
    late ReternedResponse reternedResponse;

    FormData data = FormData.fromMap({'clerkId': clerkId});
    Response<dynamic> response = await dio.post(getClerkCountriesUrl, data: data);
    Map<dynamic, dynamic> responseBody = jsonDecode(response.data);
    bool statu = responseBody['statu'] == 'success' ? true : false;
    if (statu) {
      List<dynamic> countriesResponse = responseBody['result'];
      for (Map country in countriesResponse) {
        countriesList.add(Country.fromJson(country));
      }
      reternedResponse = ReternedResponse(message: '', state: statu, type: ReternedResponseType.success);
    } else {
      reternedResponse = ReternedResponse(message: ECGC100P, state: statu, type: ReternedResponseType.wentWrong);
    }
    notifyListeners();
    return Result(response: reternedResponse);
  }
}
