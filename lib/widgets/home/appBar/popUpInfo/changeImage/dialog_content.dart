import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../configurations/consts/consts.dart';
import '../../../../../configurations/consts/consts_colors.dart';
import '../../../../../configurations/functions.dart';
import '../../../../../configurations/rounded_card_file_image.dart';
import '../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class DialogContent extends StatefulWidget {
  final Function(File image, bool loadState) getImageFile;
  final bool upload;
  const DialogContent({super.key, required this.getImageFile, required this.upload});

  @override
  State<DialogContent> createState() => _DialogContentState();
}

class _DialogContentState extends State<DialogContent> {
  final ImagePicker picker = ImagePicker();
  File? file;
  bool loadState = false;

  initImage(ImageSource imageSource) async {
    await chooseImage(picker: picker, imageSource: imageSource).then((imgFile) => setState(() {
          file = imgFile;
          loadState = true;
          widget.getImageFile(file!, loadState);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return widget.upload
        ? const SizedBox(
            width: 100,
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(LocaleKeys.globalVocabulary_selectImageSource.tr()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () => initImage(ImageSource.gallery), icon: const Icon(imageIcon, color: orange)),
                      Text(LocaleKeys.globalVocabulary_gallery.tr(), style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () => initImage(ImageSource.camera), icon: const Icon(cameraIcon, color: orange)),
                      Text(LocaleKeys.globalVocabulary_camera.tr(), style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ],
              ),
              const Divider(),
              if (loadState)
                RoundedCardFileImage(
                  height: 150,
                  width: 150,
                  radius: 12,
                  image: file!,
                ),
            ],
          );
  }
}
