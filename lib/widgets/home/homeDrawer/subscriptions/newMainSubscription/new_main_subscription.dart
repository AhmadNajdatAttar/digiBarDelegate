import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../../../../../configurations/animated_switcher_sccess.dart';
import '../../../../../configurations/consts/consts_colors.dart';
import '../../../../../configurations/functions.dart';

import '../../../../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../../../../models/client.dart';
import '../../../../../models/coin.dart';
import '../../../../../models/hall.dart';
import '../../../../../models/main_subscription.dart';
import '../../../../../models/main_subscription_payment.dart';
import '../../../../../models/plan_cost.dart';
import '../../../../../models/tax_account.dart';
import '../../../../../providers/coin_provider.dart';
import '../../../../../providers/main_subscription_provider.dart';
import '../../../../../providers/new_main_subscription_provider.dart';
import '../../../../../providers/plan_cost_provider.dart';
import '../../../../../providers/plan_duratioin_provider.dart';
import '../../../shared_app_bar.dart';
import 'halls/halls.dart';
import 'submit_button.dart';
import 'subscriptionForm/subscription_form.dart';
import 'subscriptionPayment/subscription_payment.dart';

class NewMainSubscription extends StatefulWidget {
  final int clerckId;
  const NewMainSubscription({super.key, required this.clerckId});

  @override
  State<NewMainSubscription> createState() => _NewSubscriptionState();
}

class _NewSubscriptionState extends State<NewMainSubscription> {
  TextEditingController clientNameController = TextEditingController();
  TextEditingController clientAddressController = TextEditingController();
  TextEditingController ownerFullNameController = TextEditingController();
  TextEditingController ownerPhoneNumberController = TextEditingController();
  TextEditingController managerFullNameController = TextEditingController();
  TextEditingController managerPhoneNumberController = TextEditingController();

  int clientCategory = 0;
  int clientClassification = 0;
  int clientCountry = 0;
  bool haveTaxAccount = false;
  int selectedCoinId = 0;
  int clientCity = 0;
  int subscriptionPlan = 0;
  int subscriptionPlanCostId = 0;
  DateTime subscriptionPlanEndTime = DateTime.now();

  DateTime expireDateTime = DateTime.now();
  bool taxAccountRequired = false;
  bool taxSynchronizationRequired = false;
  bool clientCoordinatesState = false;
  Position clientCoordinates = Position(
      longitude: 0,
      latitude: 0,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      altitudeAccuracy: 0,
      heading: 0,
      headingAccuracy: 0,
      speed: 0,
      speedAccuracy: 0);

  File? checkImage;
  getImageFile(File imagVal) => setState(() => checkImage = imagVal);

  GlobalKey<FormState> subscriptionFormKey = GlobalKey<FormState>();

  selectedClientCategory(int id) => setState(() => clientCategory = id);
  selectedClientClassification(int id) => setState(() => clientClassification = id);
  selectedClientCountry(int id, bool taxAccount) {
    setState(() {
      clientCity = 0;
      clientCountry = id;
      haveTaxAccount = taxAccount;
    });

    List<Coin> coins = Provider.of<CoinProvider>(context, listen: false).coins;
    setState(() => selectedCoinId = coins.firstWhere((c) => c.countryId == id).id);
  }

  selectedClientCity(int id) => setState(() => clientCity = id);
  selectedPlan(int id) {
    setState(() {
      subscriptionPlanCostId = 0;
      subscriptionPlan = id;
    });
  }

  selectedTaxAccountRequired(bool id) => setState(() {
        taxAccountRequired = id;
        taxAccountRequiredValue(id);
      });
  selectedTaxSynchronizationRequired(bool id) => setState(() {
        taxSynchronizationRequired = id;
        taxSynchronizationRequiredValue(id);
      });

  selectedPosition(Position position, bool clientCoordinatesStateVal) {
    setState(() {
      clientCoordinates = position;
      clientCoordinatesState = clientCoordinatesStateVal;
    });
  }

  List<Hall> halls = [];

  addHall(Hall hallValue) => setState(() => halls.add(hallValue));

  clearHallsAndTaxs() {
    setState(() {
      halls.clear();
      taxsAccounts.clear();
    });
  }

  deleteHall(String hallName) => setState(() => halls.removeWhere((h) => h.hallName == hallName));

  deleteTaxAccount(int taxId) => setState(() {
        setState(() {
          taxsAccounts.removeWhere((t) => t.id == taxId);
          halls.removeWhere((h) => h.taxAccountId == taxId);
        });
      });

  GlobalKey<FormState> taxAccountFormKey = GlobalKey<FormState>();

  List<TaxAccount> taxsAccounts = [];
  addTaxAccount(TaxAccount taxAccount) => setState(() => taxsAccounts.add(taxAccount));

  taxAccountRequiredValue(bool taxAccountRequiredVal) => setState(() {
        taxAccountRequired = taxAccountRequiredVal;
        clearHallsAndTaxs();
      });
  taxSynchronizationRequiredValue(bool taxSynchronizationRequiredVal) => setState(() {
        taxSynchronizationRequired = taxSynchronizationRequiredVal;
        clearHallsAndTaxs();
      });

  ManiSubscriptionPayment payment = ManiSubscriptionPayment();

  selectedPlanCost(int id) {
    setState(() {
      subscriptionPlanCostId = id;
      payment = ManiSubscriptionPayment();
    });
  }

  submitForm() async {
    if (subscriptionFormKey.currentState!.validate()) {
      if (halls.isEmpty) {
        if (taxAccountFormKey.currentState!.validate()) {
          snackMessage(
            ctx: context,
            msg: LocaleKeys.home_subscriptions_newMainSubscription_halls_atLeastOneHallMustBeAdded.tr(),
            color: red,
          );
        }
      } else {
        int planDurationId = Provider.of<PlanCostProvider>(context, listen: false)
            .plansCosts
            .firstWhere((pc) => pc.id == subscriptionPlanCostId)
            .durationId;
        int durationType = Provider.of<PlanDurationProvider>(context, listen: false)
            .planDurations
            .firstWhere((pd) => pd.id == planDurationId)
            .type;
        setState(() {
          expireDateTime = DateTime(
            expireDateTime.year,
            expireDateTime.month + durationType,
            expireDateTime.day,
          );
        });
        submitDialog(
            func: confirmSubscription, contentTitle: LocaleKeys.login_logout_areYouSureToLogout.tr(), context: context);
      }
    }
  }

  uploadPrecentage() {
    showDialog(
        context: context,
        builder: (c) => StatefulBuilder(
            builder: (context, StateSetter setState) => AnimatedSwitcherSuccess(
                showSuccess: showSuccess,
                progressValue: Provider.of<NewMainSubscriptionProvider>(context).newSubscriptionProgress)));
  }

  confirmSubscription() {
    Navigator.pop(context);
    setShowForm();
    uploadPrecentage();
    PlanCost planCost = Provider.of<PlanCostProvider>(context, listen: false)
        .plansCosts
        .where((pc) => pc.id == subscriptionPlanCostId)
        .first;
    MainSubscription mainSubscription = MainSubscription(
      id: 0,
      taxSynchronizationRequired: taxSynchronizationRequired,
      taxAccountRequired: taxAccountRequired,
      clerkId: widget.clerckId,
      planCostId: subscriptionPlanCostId,
      clientId: 0,
      startDateTime: DateTime.now(),
      expireDateTime: expireDateTime,
      state: false,
      logged: false,
      clientAcceptedTermsOfUse: false,
      serialKey: '',
      upgraded: false,
      upgradedFrom: 0,
      upgradedDate: DateTime.now(),
      canceled: false,
      client: Client(
          id: 0,
          clientCategoryId: clientCategory,
          clientClassificationId: clientClassification,
          clerkId: widget.clerckId,
          cityId: clientCity,
          title: clientNameController.text,
          address: clientAddressController.text,
          longitude: clientCoordinates.longitude,
          latitude: clientCoordinates.latitude,
          ownerFullName: ownerFullNameController.text,
          ownerPhoneNumber: ownerPhoneNumberController.text,
          managerFullName: managerFullNameController.text,
          managerPhoneNumber: managerPhoneNumberController.text,
          timeCreate: DateTime.now(),
          state: true),
      planCost: planCost,
      halls: halls,
      taxAccounts: taxsAccounts,
      maniSubscriptionPayment: ManiSubscriptionPayment(imageFile: checkImage!),
    );
    tryCatch(
            ctx: context,
            function: Provider.of<NewMainSubscriptionProvider>(context, listen: false)
                .newSubscription(mainSubscription: mainSubscription))
        .then((result) async {
      switch (result.response.state) {
        case true:
          Provider.of<MainSubscriptionProvider>(context, listen: false)
              .addSubscription(result.result as MainSubscription);
          await animatedProgressSuccess();
          Navigator.pop(context);
          Navigator.pop(context);
        case false:
          Navigator.pop(context);
          setShowForm();
          snackMessage(ctx: context, msg: result.response.message, color: red);
      }
    });
  }

  bool showForm = true;
  void setShowForm() => setState(() => showForm = !showForm);

  bool showSuccess = false;
  // Widget that animates between CustomCirculerProgress and SuccessCheck
  animatedProgressSuccess() async {
    // Toggle the showSuccess state to switch between the two widgets
    setState(() => showSuccess = !showSuccess);
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(title: LocaleKeys.home_subscriptions_newMainSubscription_newMainSubscription.tr()),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: showForm
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(LocaleKeys.globalVocabulary_enterTheRequiredData.tr(),
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                    SubscriptionForm(
                      subscriptionFormKey: subscriptionFormKey,
                      taxAccountRequiredValue: taxAccountRequiredValue,
                      taxSynchronizationRequiredValue: taxSynchronizationRequiredValue,
                      selectedPlanCost: selectedPlanCost,
                      clientNameController: clientNameController,
                      clientAddressController: clientAddressController,
                      ownerFullNameController: ownerFullNameController,
                      ownerPhoneNumberController: ownerPhoneNumberController,
                      managerFullNameController: managerFullNameController,
                      managerPhoneNumberController: managerPhoneNumberController,
                      clientCategory: clientCategory,
                      clientClassification: clientClassification,
                      clientCountry: clientCountry,
                      clientCity: clientCity,
                      subscriptionPlan: subscriptionPlan,
                      selectedPlanClassId: subscriptionPlan,
                      haveTaxAccount: haveTaxAccount,
                      taxAccountRequired: taxAccountRequired,
                      taxSynchronizationRequired: taxSynchronizationRequired,
                      clientCoordinatesState: clientCoordinatesState,
                      clientCoordinates: clientCoordinates,
                      selectedClientCategory: selectedClientCategory,
                      selectedClientClassification: selectedClientClassification,
                      selectedClientCountry: selectedClientCountry,
                      selectedClientCity: selectedClientCity,
                      selectedPosition: selectedPosition,
                      selectedPlan: selectedPlan,
                      selectedCoinId: selectedCoinId,
                      subscriptionPlanCostId: subscriptionPlanCostId,
                      // selectedSupportPlan: selectedSupportPlan,
                      selectedTaxAccountRequired: selectedTaxAccountRequired,
                      selectedTaxSynchronizationRequired: selectedTaxSynchronizationRequired,
                    ),
                    Halls(
                      addHall: addHall,
                      clearHallsAndTaxs: clearHallsAndTaxs,
                      deleteTaxAccount: deleteTaxAccount,
                      deleteHall: deleteHall,
                      taxAccountFormKey: taxAccountFormKey,
                      taxAccountRequired: taxAccountRequired,
                      taxSynchronizationRequired: taxSynchronizationRequired,
                      halls: halls,
                      taxsAccounts: taxsAccounts,
                      addTaxAccount: addTaxAccount,
                    ),
                    if (subscriptionPlanCostId != 0)
                      SubscriptionPayment(
                        selectedPlanCostId: subscriptionPlanCostId,
                        clerkId: widget.clerckId,
                        getImageFile: getImageFile,
                      ),
                    SubmitButton(submitForm: submitForm),
                  ],
                )
              : const Padding(padding: EdgeInsets.all(0)),
        ),
      ),
    );
  }
}
