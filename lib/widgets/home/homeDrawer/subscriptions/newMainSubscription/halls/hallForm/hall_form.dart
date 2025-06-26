import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../../../../../../models/tax_account.dart';
import 'hall_name.dart';
import 'taxAccount/add_tax_account_button.dart';
import 'taxAccount/taxAccountForm/tax_account_form.dart';
import 'taxAccount/taxs_list.dart';

class HallForm extends StatefulWidget {
  final List<TaxAccount> taxsAccounts;
  final Function(int id) selectTaxAccount;
  final Function() prepaerHallWithNewTaxForm;
  final Function() prepaerHallWithTaxFromList;
  final TextEditingController hallNameController;
  final TextEditingController taxNumberController;
  final TextEditingController accountUsernameController;
  final TextEditingController accountPasswordController;
  final GlobalKey<FormState> taxAccountFormKey;
  final bool taxAccountRequired;
  final bool taxSynchronizationRequired;

  const HallForm({
    super.key,
    required this.taxsAccounts,
    required this.selectTaxAccount,
    required this.prepaerHallWithNewTaxForm,
    required this.prepaerHallWithTaxFromList,
    required this.hallNameController,
    required this.taxNumberController,
    required this.accountUsernameController,
    required this.accountPasswordController,
    required this.taxAccountFormKey,
    required this.taxAccountRequired,
    required this.taxSynchronizationRequired,
  });

  @override
  State<HallForm> createState() => _HallFormState();
}

class _HallFormState extends State<HallForm> {
  GlobalKey<TaxsListState> taxsListStateKey = GlobalKey<TaxsListState>();

  bool addNewTaxAccount = true;
  addTaxAccount() => setState(() => addNewTaxAccount = !addNewTaxAccount);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.taxAccountFormKey,
      child: Wrap(
        runSpacing: 10,
        spacing: 30,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          HallName(hallNameController: widget.hallNameController),
          addNewTaxAccount && widget.taxsAccounts.isNotEmpty
              ? Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  runSpacing: 10,
                  spacing: 30,
                  children: [
                    if (widget.taxAccountRequired)
                      TaxsList(
                        taxsAccounts: widget.taxsAccounts,
                        selectTaxAccount: widget.selectTaxAccount,
                      ),
                    AddTaxAccountButton(
                      title: LocaleKeys.globalVocabulary_confirm.tr(),
                      addTaxAccount: widget.prepaerHallWithTaxFromList,
                    ),
                    if (widget.taxAccountRequired)
                      AddTaxAccountButton(
                        title: LocaleKeys.home_subscriptions_newMainSubscription_tax_addNewTaxAccount.tr(),
                        addTaxAccount: addTaxAccount,
                      ),
                  ],
                )
              : Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  runSpacing: 10,
                  spacing: 30,
                  children: [
                    // if (widget.taxAccountRequired)
                    TaxAccountForm(
                      taxNumberController: widget.taxNumberController,
                      accountUsernameController: widget.accountUsernameController,
                      accountPasswordController: widget.accountPasswordController,
                      prepaerHallWithNewTaxForm: widget.prepaerHallWithNewTaxForm,
                      taxAccountRequired: widget.taxAccountRequired,
                      taxSynchronizationRequired: widget.taxSynchronizationRequired,
                    ),
                    if (!addNewTaxAccount && widget.taxsAccounts.isNotEmpty && widget.taxAccountRequired)
                      AddTaxAccountButton(
                        title: LocaleKeys.home_subscriptions_newMainSubscription_tax_selectTaxAccountFromTheList.tr(),
                        addTaxAccount: addTaxAccount,
                      ),
                  ],
                ),
        ],
      ),
    );
  }
}
