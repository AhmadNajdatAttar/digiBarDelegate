import 'package:flutter/foundation.dart';

import '../models/main_subscription.dart';

class MainSubscriptionProvider extends ChangeNotifier {
  List<MainSubscription> mainSubscriptionsList = [];
  List<MainSubscription> get mainSubscriptions => mainSubscriptionsList;

  void addSubscription(MainSubscription subscription) {
    mainSubscriptionsList.add(subscription);
    notifyListeners();
  }
}
