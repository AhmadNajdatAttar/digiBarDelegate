// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../models/result.dart';
import '../models/reterned_response.dart';
import '../widgets/home/appBar/popUpInfo/changeImage/choose_image.dart';
import '../widgets/home/appBar/popUpInfo/logOut/logout.dart';
import '../widgets/home/appBar/popUpInfo/modifyPassword/modify_password.dart';
import 'consts/consts.dart';
import 'consts/consts_colors.dart';

String? getFont({required String languageCode}) {
  switch (languageCode) {
    case 'ar':
      return 'hacen';
    case 'en':
      return 'codehack';
    default:
      return 'hacen';
  }
}

Random rnd = Random();

String getRandomInteger(int length) =>
    String.fromCharCodes(Iterable.generate(length, (_) => integerChars.codeUnitAt(rnd.nextInt(integerChars.length))));

snackMessage({required BuildContext ctx, required String msg, Color? color}) => ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Center(
            child: Text(
          msg,
          style: TextStyle(color: white, fontSize: 18, fontFamily: LocaleKeys.font_primary.tr()),
        )),
        backgroundColor: color!,
        width: MediaQuery.of(ctx).size.width / 2,
        duration: const Duration(seconds: 20),
      ),
    );

Future<Result> tryCatch({
  required BuildContext ctx,
  required Future<Result> function,
  String msg = '',
}) async {
  late ReternedResponse reternedResponse;
  late Object? result = Object();

  try {
    await function.then((response) {
      reternedResponse = response.response;
      result = response.result;

      msg = reternedResponse.message;
    });
  } on DioException catch (d) {
    reternedResponse =
        ReternedResponse(message: d.type.name.toString(), state: false, type: ReternedResponseType.wentWrong);
    snackMessage(ctx: ctx, msg: '${reternedResponse.message}/n $msg', color: red);
  } catch (e) {
    reternedResponse =
        ReternedResponse(message: '${e.toString()}  \n $msg', state: false, type: ReternedResponseType.noInternet);
    snackMessage(ctx: ctx, msg: reternedResponse.message, color: red);
  }
  return Result(response: reternedResponse, result: result);
}

Future<File> chooseImage({required ImagePicker picker, required ImageSource imageSource}) async {
  File file;
  final XFile? image = await picker.pickImage(source: imageSource, imageQuality: 50);
  file = File(image!.path);
  return file;
}

showChooseImageDialog(BuildContext ctx) => showDialog(context: ctx, builder: (c) => const ChooseImage());

showModifyPasswordDialog(BuildContext ctx) => showDialog(context: ctx, builder: (c) => const ModifyPassword());
showLogoutDialog(BuildContext ctx) => showDialog(context: ctx, builder: (c) => const LogOut());

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error('Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

focusWidget(BuildContext context, {required FocusNode node}) => FocusScope.of(context).requestFocus(node);

submitDialog({required BuildContext context, required Function func, required String contentTitle}) {
  showDialog(
      context: context,
      builder: (c) => AlertDialog(
            content: Text(contentTitle, textAlign: TextAlign.center),
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  LocaleKeys.globalVocabulary_cancel.tr(),
                  style: TextStyle(fontFamily: LocaleKeys.font_primary.tr()),
                ),
              ),
              OutlinedButton(
                onPressed: () => func(),
                child: Text(
                  LocaleKeys.globalVocabulary_confirm.tr(),
                  style: TextStyle(fontFamily: LocaleKeys.font_primary.tr()),
                ),
              ),
            ],
          ));
}
