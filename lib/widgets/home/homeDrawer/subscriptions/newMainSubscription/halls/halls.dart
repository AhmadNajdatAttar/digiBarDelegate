import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../configurations/functions.dart';
import '../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../../../../../models/hall.dart';
import '../../../../../../models/tax_account.dart';
import 'hallForm/hall_form.dart';
import 'hallForm/taxAccount/taxs_table.dart';
import 'hallsTable/halls_table.dart';

class Halls extends StatefulWidget {
  final bool taxAccountRequired;
  final bool taxSynchronizationRequired;
  final List<Hall> halls;
  final Function(Hall hallValue) addHall;
  final Function() clearHallsAndTaxs;
  final Function(int taxId) deleteTaxAccount;
  final Function(String hallName) deleteHall;
  final GlobalKey<FormState> taxAccountFormKey;
  final List<TaxAccount> taxsAccounts;
  final Function(TaxAccount taxAccount) addTaxAccount;
  const Halls({
    super.key,
    required this.taxAccountRequired,
    required this.taxSynchronizationRequired,
    required this.halls,
    required this.addHall,
    required this.clearHallsAndTaxs,
    required this.deleteTaxAccount,
    required this.deleteHall,
    required this.taxAccountFormKey,
    required this.taxsAccounts,
    required this.addTaxAccount,
  });

  @override
  State<Halls> createState() => HallsState();
}

class HallsState extends State<Halls> {
  bool addNewHall = true;

  int selectedTaxAccount = 0;

  selectTaxAccount(int number) => setState(() => selectedTaxAccount = number);

  TextEditingController hallNameController = TextEditingController();
  TextEditingController taxNumberController = TextEditingController();
  TextEditingController accountUsernameController = TextEditingController();
  TextEditingController accountPasswordController = TextEditingController();

  bool prepaerHallWithNewTaxForm() {
    if (widget.taxAccountFormKey.currentState!.validate()) {
      int taxAccountId = int.parse(getRandomInteger(5));
      TaxAccount taxAccount = TaxAccount(
        id: taxAccountId,
        subscriptionId: 0,
        number: taxNumberController.text,
        userName: accountUsernameController.text,
        password: accountPasswordController.text,
        timeCreate: DateTime.now(),
      );
      setState(() {
        widget.addHall(Hall(
          id: 0,
          subscriptionId: 0,
          taxAccountId: taxAccountId,
          hallName: hallNameController.text,
          state: false,
          requiredTaxAccount: false,
          approveClerkId: 0,
          timeCreate: DateTime.now(),
        ));

        widget.addTaxAccount(taxAccount);
        selectedTaxAccount = taxAccount.id!;
        cancel();
      });
      return true;
    } else {
      return false;
    }
  }

  bool prepaerHallWithTaxFromList() {
    if (widget.taxAccountFormKey.currentState!.validate()) {
      for (var d in widget.taxsAccounts) {
        if (d.id == selectedTaxAccount) {
          setState(() {
            widget.addHall(Hall(
              id: 0,
              subscriptionId: 0,
              taxAccountId: d.id!,
              hallName: hallNameController.text,
              state: false,
              requiredTaxAccount: false,
              approveClerkId: 0,
              timeCreate: DateTime.now(),
            ));
          });
          cancel();
        }
      }
      return true;
    } else {
      return false;
    }
  }

  deleteHall(String hallName) {
    setState(() {
      widget.deleteHall(hallName);
      if (widget.halls.isEmpty) {
        addNewHall = true;
      }
    });
  }

  deleteTaxAccount(int taxId) {
    setState(() {
      widget.deleteTaxAccount(taxId);
      if (widget.halls.isEmpty) {
        addNewHall = true;
      }
    });
  }

  cancel() {
    setState(() {
      hallNameController.clear();
      taxNumberController.clear();
      accountUsernameController.clear();
      accountPasswordController.clear();
      addNewHall = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 5),
                        child: Text(
                          LocaleKeys.home_subscriptions_newMainSubscription_halls_halls.tr(),
                          style: Theme.of(context).textTheme.displayLarge,
                        )),
                    Text(LocaleKeys.home_subscriptions_newMainSubscription_halls_atLeastOneHallMustBeAdded.tr(),
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                if (!addNewHall)
                  OutlinedButton(
                      onPressed: () => setState(() => addNewHall = true),
                      child: Text(
                        LocaleKeys.home_subscriptions_newMainSubscription_halls_addHall.tr(),
                        style: TextStyle(fontFamily: LocaleKeys.font_primary.tr()),
                      ))
              ],
            ),
            if (widget.taxsAccounts.isNotEmpty && widget.taxAccountRequired)
              TaxsTable(
                taxAccounts: widget.taxsAccounts,
                deleteTaxAccount: deleteTaxAccount,
                taxSynchronizationRequired: widget.taxSynchronizationRequired,
              ),
            if (widget.halls.isNotEmpty)
              HallsTable(
                halls: widget.halls,
                deleteHall: deleteHall,
                taxAccounts: widget.taxsAccounts,
                taxAccountRequired: widget.taxAccountRequired,
              ),
            if (addNewHall)
              HallForm(
                taxsAccounts: widget.taxsAccounts,
                selectTaxAccount: selectTaxAccount,
                hallNameController: hallNameController,
                taxNumberController: taxNumberController,
                accountUsernameController: accountUsernameController,
                accountPasswordController: accountPasswordController,
                taxAccountFormKey: widget.taxAccountFormKey,
                prepaerHallWithNewTaxForm: prepaerHallWithNewTaxForm,
                prepaerHallWithTaxFromList: prepaerHallWithTaxFromList,
                taxSynchronizationRequired: widget.taxSynchronizationRequired,
                taxAccountRequired: widget.taxAccountRequired,
              ),
            if (addNewHall && widget.halls.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: ElevatedButton(
                    onPressed: () => cancel(),
                    child: Text(
                      LocaleKeys.globalVocabulary_cancel.tr(),
                      style: TextStyle(fontFamily: LocaleKeys.font_primary.tr()),
                    )),
              )
          ],
        ),
      ),
    );
  }
}
