import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../configurations/paths/get_paths.dart';
import '../models/clerk.dart';

class ClerkProvider extends ChangeNotifier {
  final Dio dio = Dio();
  List<Clerk> clerksList = <Clerk>[];
  List<Clerk> get clerks => clerksList;

  Future getCountries() async {
    Response<dynamic> response = await dio.post(getClerksUrl);
    Map<dynamic, dynamic> responseBody = jsonDecode(response.data);
    List<dynamic> clerksResponse = responseBody['result'];
    for (Map clerk in clerksResponse) {
      clerksList.add(Clerk.fromJson(clerk));
    }
  }
}
