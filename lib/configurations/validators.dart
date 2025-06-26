// Login

import 'package:easy_localization/easy_localization.dart';

import '../generated/locale_keys.g.dart/codegen_loader.g.dart';

usernameValidator(String? val) {
  if (val!.trim().isEmpty) {
    return LocaleKeys.login_loginForm_validation_thisFieldIsRequired.tr();
  } else {
    return null;
  }
}

passwordValidator(String? val) {
  if (val!.trim().isEmpty) {
    return LocaleKeys.login_loginForm_validation_thisFieldIsRequired.tr();
  } else {
    return null;
  }
}

newPasswordValidator(String? val) {
  if (val!.trim().isEmpty) {
    return LocaleKeys.login_loginForm_validation_thisFieldIsRequired.tr();
  } else if (val.trim().length < 8) {
    return LocaleKeys.login_loginForm_validation_passwordMustBeAtLeast8CharactersLong.tr();
  } else {
    return null;
  }
}

confirmPasswordValidator(String? val, String? confirmVal) {
  if (confirmVal!.trim().isEmpty) {
    return LocaleKeys.login_loginForm_validation_thisFieldIsRequired.tr();
  } else if (val!.trim() != confirmVal.trim()) {
    return LocaleKeys.login_loginForm_validation_passwordDoesNotMatch.tr();
  } else {
    return null;
  }
}

sharedValidator(String? val) {
  if (val!.trim().isEmpty) {
    return LocaleKeys.login_loginForm_validation_thisFieldIsRequired.tr();
  } else {
    return null;
  }
}

dropDownSharedValidator(Object? val) {
  if (val == null) {
    return LocaleKeys.login_loginForm_validation_thisFieldIsRequired.tr();
  } else {
    return null;
  }
}
