import 'package:flutter/material.dart';
import '../../generated/codegen_loader.g.dart';
import '../confirm_controller_state.dart';

const domain = 'https://olabifuturedental.com/digiBar';

const ext = '.php';
const String get = '/get';
const String insert = '/insert';
const String update = '/update';
const String delete = '/delete';

const String general = '$domain/general';
const String assets = '$domain/assets';

//Assets

const String images = '$assets/images';
const String userImage = '$images/userImage/';
const String paymentsImage = '$images/paymentsImage/';
const String mainSubscriptionCheckImage = '$paymentsImage/mainSubscriptionCheckImage/';

//Delegate
const String delegate = '$domain/delegate';
const String authentication = '$delegate/authentication';
const String login = '$authentication/login';

const String country = '$delegate/country';
const String city = '$delegate/city';
const String clientClassification = '$delegate/clientClassification';
const String clientCategory = '$delegate/clientCategory';
const String plan = '$delegate/plan';
const String clerk = '$general/clerk';
const String subscription = '$delegate/subscription';
const String notification = '$delegate/notification';
const String category = '$notification/category';

const double roundedLoadingButtonBorderRadius = 12;
const double loaderSize = 15;
const IconData successIcon = Icons.check;
const IconData failedIcon = Icons.close;
const IconData darkIcon = Icons.brightness_2_sharp;
const IconData lightIcon = Icons.brightness_high;
const IconData logoutIcon = Icons.logout_rounded;
const IconData changePasswordIcon = Icons.password_outlined;
const IconData changeImageIcon = Icons.camera;
const IconData imageIcon = Icons.image;
const IconData cameraIcon = Icons.camera;
const IconData locationIcon = Icons.location_on_outlined;

const ConfirmControllerState success = ConfirmControllerState.success;
const ConfirmControllerState error = ConfirmControllerState.error;
const ConfirmControllerState reset = ConfirmControllerState.reset;
const ConfirmControllerState stop = ConfirmControllerState.stop;

const integerChars = '1234567890';
const allChars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
List<Locale> locales = const [Locale('ar'), Locale('en')];

const Locale fallbackLocale = Locale('en');
const String localizationPath = 'assets/translations';
const CodegenLoader assetLoader = CodegenLoader();

  // Locale('bg'),
  // Locale('bn'),
  // Locale('cs'),
  // Locale('da'),
  // Locale('de'),
  // Locale('el'),
  // Locale('es'),
  // Locale('fa'),
  // Locale('fi'),
  // Locale('fr'),
  // Locale('ga'),
  // Locale('gd'),
  // Locale('he'),
  // Locale('hi'),
  // Locale('hy'),
  // Locale('id'),
  // Locale('it'),
  // Locale('ja'),
  // Locale('ko'),
  // Locale('ku'),
  // Locale('no'),
  // Locale('pl'),
  // Locale('ps'),
  // Locale('pt'),
  // Locale('ru'),
  // Locale('sv'),
  // Locale('tk'),
  // Locale('tr'),
  // Locale('uk'),
  // Locale('ur'),
  // Locale('zh'),