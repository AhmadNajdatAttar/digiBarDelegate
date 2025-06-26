import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../configurations/consts/consts_colors.dart';
import '../../../../../configurations/functions.dart';
import '../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../../../../providers/user_provider.dart';
import 'dialog_content.dart';

class ChooseImage extends StatefulWidget {
  const ChooseImage({super.key});

  @override
  State<ChooseImage> createState() => _ChooseImageState();
}

class _ChooseImageState extends State<ChooseImage> {
  File? file;
  bool loadState = false;
  bool upload = false;

  getImageFile(File imagVal, bool loadStateVal) {
    setState(() {
      file = imagVal;
      loadState = loadStateVal;
    });
  }

  uploadImage() async {
    setState(() => upload = true);

    await tryCatch(
      ctx: context,
      msg: LocaleKeys.globalVocabulary_imageUpdateFailed.tr(),
      function: Provider.of<UserProvider>(context, listen: false).updateImage(image: file!),
    ).then((result) {
      switch (result.response.state) {
        case true:
          Navigator.pop(context);
          snackMessage(ctx: context, msg: result.response.message, color: green);
        case false:
          setState(() => upload = false);
          snackMessage(ctx: context, msg: result.response.message, color: red);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      contentPadding: const EdgeInsets.only(top: 20, bottom: 10),
      content: DialogContent(getImageFile: getImageFile, upload: upload),
      actions: upload
          ? []
          : [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  LocaleKeys.globalVocabulary_cancel.tr(),
                  style: TextStyle(fontFamily: LocaleKeys.font_primary.tr()),
                ),
              ),
              if (loadState)
                OutlinedButton(
                  onPressed: () => uploadImage(),
                  child: Text(
                    LocaleKeys.globalVocabulary_confirm.tr(),
                    style: TextStyle(fontFamily: LocaleKeys.font_primary.tr()),
                  ),
                ),
            ],
    );
  }
}
