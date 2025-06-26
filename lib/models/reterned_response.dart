import 'package:easy_localization/easy_localization.dart';

import '../generated/locale_keys.g.dart/codegen_loader.g.dart';

class ReternedResponse {
  final bool state;
  final String message;
  final ReternedResponseType type;
  Object? object;

  ReternedResponse({
    required this.state,
    required this.message,
    required this.type,
    this.object,
  });
}

enum ReternedResponseType {
  noInternet,
  wentWrong,
  loginSuccess,
  loginIncorrectinformation,
  mustNewLogin,
  refreshLoginToken,
  imageUploadesSuccfully,
  imageUploadFaild,
  success,
}

ReternedResponse loginSuccess = ReternedResponse(
    message: LocaleKeys.login_loginForm_validation.tr(), state: true, type: ReternedResponseType.loginSuccess);

ReternedResponse loginIncorrectinformation = ReternedResponse(
    message: LocaleKeys.login_loginForm_validation_incorrectInformation.tr(),
    state: false,
    type: ReternedResponseType.loginIncorrectinformation);
