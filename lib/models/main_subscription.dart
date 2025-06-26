import 'client.dart';
import 'hall.dart';
import 'main_subscription_payment.dart';
import 'plan_cost.dart';
import 'tax_account.dart';

class MainSubscription {
  late int id;
  late bool taxSynchronizationRequired;
  late bool taxAccountRequired;
  late int clerkId;
  late int planCostId;
  late int clientId;
  late DateTime startDateTime;
  late DateTime expireDateTime;
  late bool state;
  late bool logged;
  late bool clientAcceptedTermsOfUse;
  late String serialKey;
  late bool upgraded;
  late int upgradedFrom;
  late DateTime upgradedDate;
  late bool canceled;
  late Client client;
  late PlanCost planCost;
  late List<Hall> halls;
  late List<TaxAccount> taxAccounts;
  late ManiSubscriptionPayment maniSubscriptionPayment;
  MainSubscription({
    required this.id,
    required this.taxSynchronizationRequired,
    required this.taxAccountRequired,
    required this.clerkId,
    required this.planCostId,
    required this.clientId,
    required this.startDateTime,
    required this.expireDateTime,
    required this.state,
    required this.logged,
    required this.clientAcceptedTermsOfUse,
    required this.serialKey,
    required this.upgraded,
    required this.upgradedFrom,
    required this.upgradedDate,
    required this.canceled,
    required this.client,
    required this.planCost,
    required this.halls,
    required this.taxAccounts,
    required this.maniSubscriptionPayment,
  });

  MainSubscription.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    taxSynchronizationRequired = (json['taxSynchronizationRequired'] ?? 0) == 0 ? false : true;
    taxAccountRequired = (json['taxAccountRequired'] ?? 0) == 0 ? false : true;
    clerkId = int.parse(json['clerkId']);
    planCostId = int.parse(json['planCostId']);
    clientId = int.parse(json['clientId']);
    startDateTime = json['startDateTime'] != null ? DateTime.parse(json['startDateTime']) : DateTime.now();
    expireDateTime = json['expireDateTime'] != null ? DateTime.parse(json['expireDateTime']) : DateTime.now();
    state = (json['state'] ?? 0) == 0 ? false : true;
    logged = (json['logged'] ?? 0) == 0 ? false : true;
    clientAcceptedTermsOfUse = (json['clientAcceptedTermsOfUse'] ?? 0) == 0 ? false : true;
    serialKey = json['serialKey'] ?? '';
    upgraded = (json['upgraded'] ?? 0) == 0 ? false : true;
    upgradedFrom = int.parse(json['upgradedFrom']);
    upgradedDate = json['upgradedDate'] != null ? DateTime.parse(json['upgradedDate']) : DateTime.now();
    canceled = (json['canceled'] ?? 0) == 0 ? false : true;
  }
}
