import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import 'paymentForm/payment_image.dart';

class SubscriptionPayment extends StatefulWidget {
  final int selectedPlanCostId;
  final int clerkId;
  final Function(File image) getImageFile;

  const SubscriptionPayment({
    super.key,
    required this.selectedPlanCostId,
    required this.clerkId,
    required this.getImageFile,
  });

  @override
  State<SubscriptionPayment> createState() => _SubscriptionPaymentState();
}

class _SubscriptionPaymentState extends State<SubscriptionPayment> {
  File? file;

  getImage(File imagVal) => setState(() {
        file = imagVal;
        widget.getImageFile(file!);
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 5),
                child: Text(
                  LocaleKeys.home_subscriptions_newMainSubscription_subscriptionPayment_paymentReceipt.tr(),
                  style: Theme.of(context).textTheme.displayLarge,
                )),
            PaymentImage(getImageFile: getImage)
          ],
        ),
      ),
    );
  }
}
