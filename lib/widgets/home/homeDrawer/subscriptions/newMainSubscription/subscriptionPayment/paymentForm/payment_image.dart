import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../../configurations/consts/consts.dart';
import '../../../../../../../configurations/consts/consts_colors.dart';
import '../../../../../../../configurations/functions.dart';
import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';

class PaymentImage extends StatefulWidget {
  final Function(File image) getImageFile;

  const PaymentImage({super.key, required this.getImageFile});

  @override
  State<PaymentImage> createState() => _PaymentImageState();
}

class _PaymentImageState extends State<PaymentImage> {
  final ImagePicker picker = ImagePicker();
  File? file;

  initImage() async {
    await chooseImage(picker: picker, imageSource: ImageSource.gallery).then((imgFile) => setState(() {
          file = imgFile;
          widget.getImageFile(file!);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          hintText: LocaleKeys.home_subscriptions_newMainSubscription_subscriptionPayment_receiptImage.tr(),
          suffixIcon: InkWell(onTap: () => initImage(), child: const Icon(imageIcon)),
          prefixIcon: file != null ? const Icon(Icons.check_circle, color: green) : null,
        ),
        validator: (v) {
          if (file == null) {
            return LocaleKeys.home_subscriptions_newMainSubscription_subscriptionPayment_receiptImage.tr();
          } else {
            return null;
          }
        },
      ),
    );
  }
}
