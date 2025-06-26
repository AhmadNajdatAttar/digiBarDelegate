import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../configurations/paths/get_paths.dart';
import '../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../models/result.dart';
import '../models/reterned_response.dart';
import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  final dio = Dio();
  late User user;
  User get getUser => user;

  saveUserKeys() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('id', user.id);
    await preferences.setInt('userId', user.userId);
    await preferences.setString('username', user.username);
    await preferences.setString('token', user.token);
  }

  Future<Result> login({required String username, required String password}) async {
    late ReternedResponse reternedResponse;

    FormData data = FormData.fromMap({'username': username, 'password': password});
    Response<dynamic> response = await dio.post(loginUrl, data: data);
    Map<dynamic, dynamic> responseBody = jsonDecode(response.data);

    bool statu = responseBody['statu'];

    if (statu) {
      dynamic userResponse = responseBody['result'];
      user = User.fromJson(userResponse);
      await saveUserKeys();
      reternedResponse = ReternedResponse(
          message: LocaleKeys.login_button_login.tr(), state: true, type: ReternedResponseType.loginSuccess);
    } else {
      reternedResponse = ReternedResponse(
          message: LocaleKeys.login_loginForm_validation_incorrectInformation.tr(),
          state: false,
          type: ReternedResponseType.refreshLoginToken);
    }
    return Result(response: reternedResponse);
  }

  Future<ReternedResponse> checkLogin({required String token}) async {
    late ReternedResponse result;

    FormData data = FormData.fromMap({'token': token});
    Response<dynamic> response = await dio.post(checkLoginUrl, data: data);
    Map<dynamic, dynamic> responseBody = jsonDecode(response.data);

    bool statu = responseBody['statu'];
    if (statu) {
      dynamic userResponse = responseBody['result'];
      user = User.fromJson(userResponse);
      await saveUserKeys();
      result = ReternedResponse(
          message: LocaleKeys.login_button_login.tr(), state: true, type: ReternedResponseType.loginSuccess);
    } else {
      result = ReternedResponse(
          message: LocaleKeys.login_loginForm_validation_newLoginRequired.tr(),
          state: false,
          type: ReternedResponseType.loginIncorrectinformation);
    }
    return result;
  }

  Future<Result> checkLoginInfo() async {
    late ReternedResponse reternedResponse;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey('token')) {
      String token = preferences.getString('token')!;
      reternedResponse = await checkLogin(token: token);
    } else {
      reternedResponse = ReternedResponse(message: 'mustLogin', state: false, type: ReternedResponseType.mustNewLogin);
    }
    return Result(response: reternedResponse);
  }

  Future<Result> updateImage({required File image}) async {
    late ReternedResponse reternedResponse;
    FormData data = FormData.fromMap({
      'id': user.id.toString(),
      'oldImage': user.image,
      'username': user.username,
      'newImage': await MultipartFile.fromFile(image.path),
    });
    Response<dynamic> response = await dio.post(
      uploadClerkImageUrl,
      data: data,
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    Map<dynamic, dynamic> responseBody = jsonDecode(response.data);

    bool statu = responseBody['statu'];
    if (statu) {
      dynamic userResponse = responseBody['result'];
      user.image = userResponse;
      reternedResponse = ReternedResponse(
        message: LocaleKeys.globalVocabulary_imageUpdatedSuccessfully.tr(),
        state: true,
        type: ReternedResponseType.imageUploadesSuccfully,
      );
    } else {
      reternedResponse = ReternedResponse(
        message: LocaleKeys.globalVocabulary_imageUpdateFailed.tr(),
        state: false,
        type: ReternedResponseType.imageUploadFaild,
      );
    }
    notifyListeners();
    return Result(response: reternedResponse);
  }

  Future<Result> modifyPassword({required String currentPassword, required String newPassword}) async {
    late ReternedResponse reternedResponse;
    FormData data = FormData.fromMap({
      'id': user.id.toString(),
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    });
    Response<dynamic> response = await dio.post(modifyPasswordUrl, data: data);
    Map<dynamic, dynamic> responseBody = jsonDecode(response.data);

    bool statu = responseBody['statu'];
    if (statu) {
      // dynamic userResponse = responseBody['result'];

      // user.token = userResponse;
      reternedResponse = ReternedResponse(
        message: LocaleKeys.login_loginForm_validation_passwordUpdatedSuccessfully.tr(),
        state: true,
        type: ReternedResponseType.imageUploadesSuccfully,
      );
    } else {
      reternedResponse = ReternedResponse(
        message: LocaleKeys.login_loginForm_validation_incorrectInformation.tr(),
        state: false,
        type: ReternedResponseType.imageUploadFaild,
      );
    }
    notifyListeners();
    return Result(response: reternedResponse);
  }

  logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('token');
  }
}
