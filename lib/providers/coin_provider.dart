import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../configurations/consts/error_codes.dart';
import '../configurations/paths/get_paths.dart';
import '../models/coin.dart';
import '../models/result.dart';
import '../models/reterned_response.dart';

class CoinProvider extends ChangeNotifier {
  final dio = Dio();
  List<Coin> coinsList = <Coin>[];
  List<Coin> get coins => coinsList;

  Future<Result> getCoins() async {
    late ReternedResponse reternedResponse;

    Response<dynamic> response = await dio.post(getPlanCoinsUrl);
    Map<dynamic, dynamic> responseBody = jsonDecode(response.data);
    bool statu = responseBody['statu'] == 'success' ? true : false;

    if (statu) {
      List<dynamic> coinsResponse = responseBody['result'];
      for (Map coin in coinsResponse) {
        coinsList.add(Coin.fromJson(coin));
      }
      reternedResponse = ReternedResponse(message: '', state: statu, type: ReternedResponseType.success);
    } else {
      reternedResponse = ReternedResponse(message: ECGC700P, state: statu, type: ReternedResponseType.wentWrong);
    }
    notifyListeners();
    return Result(response: reternedResponse);
  }
}
