import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'formFields/client_address.dart';
import 'formFields/client_category.dart';
import 'formFields/client_city.dart';
import 'formFields/client_classification.dart';
import 'formFields/client_coordinates.dart';
import 'formFields/client_country.dart';
import 'formFields/client_name.dart';
import 'formFields/manage_full_name.dart';
import 'formFields/manage_phone_number.dart';
import 'formFields/owner_full_name.dart';
import 'formFields/owner_phone_number.dart';
import 'formFields/planCost/plan_cost.dart';
import 'formFields/subscription_plan.dart';
import 'formFields/tax_account_required.dart';
import 'formFields/tax_synchronization_required.dart';

class SubscriptionForm extends StatefulWidget {
  final TextEditingController clientNameController;
  final TextEditingController clientAddressController;
  final TextEditingController ownerFullNameController;
  final TextEditingController ownerPhoneNumberController;
  final TextEditingController managerFullNameController;
  final TextEditingController managerPhoneNumberController;
  final int clientCategory;
  final int clientClassification;
  final int clientCountry;
  final int clientCity;
  final int subscriptionPlan;
  // final int supportPlan;
  final bool haveTaxAccount;
  final bool taxAccountRequired;
  final bool taxSynchronizationRequired;
  final bool clientCoordinatesState;
  final Position clientCoordinates;
  final Function(int id) selectedClientCategory;
  final Function(int id) selectedClientClassification;
  final Function(int id, bool taxAccount) selectedClientCountry;
  final Function(int id) selectedClientCity;
  final Function(Position position, bool clientCoordinatesStateVal) selectedPosition;
  final Function(int id) selectedPlan;
  final Function(int id) selectedPlanCost;
  final int? selectedPlanClassId;
  final int? subscriptionPlanCostId;
  final int? selectedCoinId;

  final Function(bool state) selectedTaxAccountRequired;
  final Function(bool id) selectedTaxSynchronizationRequired;

  final GlobalKey<FormState> subscriptionFormKey;
  final Function(bool taxAccountRequiredVal) taxAccountRequiredValue;
  final Function(bool taxSynchronizationRequiredVal) taxSynchronizationRequiredValue;

  const SubscriptionForm({
    super.key,
    required this.subscriptionFormKey,
    required this.taxAccountRequiredValue,
    required this.taxSynchronizationRequiredValue,
    required this.selectedPlanCost,
    required this.subscriptionPlanCostId,
    required this.clientNameController,
    required this.clientAddressController,
    required this.ownerFullNameController,
    required this.ownerPhoneNumberController,
    required this.managerFullNameController,
    required this.managerPhoneNumberController,
    required this.clientCategory,
    required this.clientClassification,
    required this.clientCountry,
    required this.clientCity,
    required this.subscriptionPlan,
    required this.selectedCoinId,
    required this.haveTaxAccount,
    required this.taxAccountRequired,
    required this.taxSynchronizationRequired,
    required this.clientCoordinatesState,
    required this.clientCoordinates,
    required this.selectedClientCategory,
    required this.selectedClientClassification,
    required this.selectedClientCountry,
    required this.selectedClientCity,
    required this.selectedPosition,
    required this.selectedPlan,
    required this.selectedPlanClassId,
    required this.selectedTaxAccountRequired,
    required this.selectedTaxSynchronizationRequired,
  });

  @override
  State<SubscriptionForm> createState() => SubscriptionFormState();
}

class SubscriptionFormState extends State<SubscriptionForm> {
  FocusNode clientAddressNode = FocusNode();
  FocusNode ownerFullNameNode = FocusNode();
  FocusNode ownerPhonNumberNode = FocusNode();
  FocusNode managerFullNameNode = FocusNode();
  FocusNode managerPhoneNumberNode = FocusNode();
  FocusNode clientCountryNode = FocusNode();
  FocusNode clientCityNode = FocusNode();
  FocusNode clientCategoryNode = FocusNode();
  FocusNode clientClassificationNode = FocusNode();
  FocusNode clientCoordinatesNode = FocusNode();
  FocusNode subscriptionPlanNode = FocusNode();
  FocusNode planCostNode = FocusNode();
  FocusNode taxAccountRequiredNode = FocusNode();
  FocusNode taxSynchronizationRequiredNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: widget.subscriptionFormKey,
        child: Wrap(
          runSpacing: 10,
          spacing: 30,
          children: [
            ClientName(
              controller: widget.clientNameController,
              nextNode: clientAddressNode,
            ),
            ClientAddress(
              controller: widget.clientAddressController,
              node: clientAddressNode,
              nextNode: ownerFullNameNode,
            ),
            OwnerFullName(
              controller: widget.ownerFullNameController,
              node: ownerFullNameNode,
              nextNode: ownerPhonNumberNode,
            ),
            OwnerPhoneNumber(
                controller: widget.ownerPhoneNumberController,
                node: ownerPhonNumberNode,
                nextNode: managerFullNameNode),
            ManagerFullName(
              controller: widget.managerFullNameController,
              node: managerFullNameNode,
              nextNode: managerPhoneNumberNode,
            ),
            ManagerPhoneNumber(
              controller: widget.managerPhoneNumberController,
              node: managerPhoneNumberNode,
              nextNode: clientCategoryNode,
            ),
            ClientCategory(
              node: clientCategoryNode,
              nextNode: clientClassificationNode,
              selectedClientCategory: widget.selectedClientCategory,
            ),
            ClientClassification(
              node: clientClassificationNode,
              nextNode: clientCountryNode,
              selectedClientClassification: widget.selectedClientClassification,
            ),
            ClientCountry(
              node: clientCountryNode,
              nextNode: clientCityNode,
              selectedClientCountry: widget.selectedClientCountry,
            ),
            ClientCity(
              node: clientCityNode,
              nextNode: clientCoordinatesNode,
              selectedClientCity: widget.selectedClientCity,
              selectedCountryId: widget.clientCountry,
              clientCity: widget.clientCity,
            ),
            ClientCoordinates(
              node: clientCoordinatesNode,
              nextNode: subscriptionPlanNode,
              selectedPosition: widget.selectedPosition,
              clientCoordinatesState: widget.clientCoordinatesState,
            ),
            SubscriptionPlan(
              node: subscriptionPlanNode,
              nextNode: planCostNode,
              selectedPlan: widget.selectedPlan,
            ),
            PlanCost(
              node: planCostNode,
              nextNode: taxAccountRequiredNode,
              selectedPlanCost: widget.selectedPlanCost,
              selectedPlanClassId: widget.selectedPlanClassId,
              selectedCoinId: widget.selectedCoinId,
              subscriptionPlanCostId: widget.subscriptionPlanCostId,
            ),
            if (widget.haveTaxAccount)
              TaxAccountRequired(
                node: taxAccountRequiredNode,
                nextNode: taxSynchronizationRequiredNode,
                taxAccountRequired: widget.taxAccountRequired,
                selectedTaxAccountRequired: widget.selectedTaxAccountRequired,
                taxSynchronizationRequired: widget.taxSynchronizationRequired,
                selectedTaxSynchronizationRequired: widget.selectedTaxSynchronizationRequired,
              ),
            if (widget.haveTaxAccount)
              TaxSynchronizationRequired(
                node: taxAccountRequiredNode,
                taxSynchronizationRequired: widget.taxSynchronizationRequired,
                selectedTaxSynchronizationRequired: widget.selectedTaxSynchronizationRequired,
                taxAccountRequired: widget.taxAccountRequired,
                selectedTaxAccountRequired: widget.selectedTaxAccountRequired,
              ),
          ],
        ),
      ),
    );
  }
}
