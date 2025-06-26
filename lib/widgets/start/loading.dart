// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configurations/consts/consts_colors.dart';
import '../../configurations/functions.dart';
import '../../digi_bar_title.dart';
import '../../generated/locale_keys.g.dart/codegen_loader.g.dart';
import '../../models/reterned_response.dart';
import '../../models/user.dart';
import '../../providers/city_provider.dart';
import '../../providers/client_category_provider.dart';
import '../../providers/client_classification_provider.dart';
import '../../providers/coin_provider.dart';
import '../../providers/country_provider.dart';
import '../../providers/main_subscription_notification_category_provider.dart';
import '../../providers/payment_category_provider.dart';
import '../../providers/plan_class_provider.dart';
import '../../providers/plan_cost_provider.dart';
import '../../providers/plan_duratioin_provider.dart';
import '../../providers/user_provider.dart';
import '../home/home.dart';
import '../login/login.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String errorCode = '';

  getCountries({required String id}) async {
    await tryCatch(
            ctx: context, function: Provider.of<CountryProvider>(context, listen: false).getCountries(clerkId: id))
        .then((result) async {
      switch (result.response.state) {
        case true:
          setState(() => errorCode = '');
          await getCities(id: id.toString());
        case false:
          setState(() => errorCode = result.response.message);
          retryingCheck(response: result.response, func: getCountries(id: id));
      }
    });
  }

  getCities({required String id}) async {
    await tryCatch(ctx: context, function: Provider.of<CityProvider>(context, listen: false).getCities(clerkId: id))
        .then((result) async {
      switch (result.response.state) {
        case true:
          setState(() => errorCode = '');
          await getClientCategories();
        case false:
          setState(() => errorCode = result.response.message);
          retryingCheck(response: result.response, func: getCities(id: id));
      }
    });
  }

  getClientCategories() async {
    await tryCatch(
            ctx: context, function: Provider.of<ClientCategoryProvider>(context, listen: false).getClientCategories())
        .then((result) async {
      switch (result.response.state) {
        case true:
          setState(() => errorCode = '');
          await getClientClassifications();
        case false:
          setState(() => errorCode = result.response.message);
          retryingCheck(response: result.response, func: getClientCategories);
      }
    });
  }

  getClientClassifications() async {
    await tryCatch(
            ctx: context,
            function: Provider.of<ClientClassificationProvider>(context, listen: false).getClientClassifications())
        .then((result) async {
      switch (result.response.state) {
        case true:
          setState(() => errorCode = '');
          await getPlanClasses();

        case false:
          setState(() => errorCode = result.response.message);
          retryingCheck(response: result.response, func: getClientClassifications);
      }
    });
  }

  getPlanClasses() async {
    await tryCatch(ctx: context, function: Provider.of<PlanClassProvider>(context, listen: false).getPlanClasses())
        .then((result) async {
      switch (result.response.state) {
        case true:
          setState(() => errorCode = '');
          await getPlanDurations();
        case false:
          setState(() => errorCode = result.response.message);
          retryingCheck(response: result.response, func: getPlanClasses);
      }
    });
  }

  getPlanDurations() async {
    await tryCatch(ctx: context, function: Provider.of<PlanDurationProvider>(context, listen: false).getPlanDurations())
        .then((result) async {
      switch (result.response.state) {
        case true:
          setState(() => errorCode = '');
          await getCoins();
        case false:
          setState(() => errorCode = result.response.message);
          retryingCheck(response: result.response, func: getPlanDurations);
      }
    });
  }

  getCoins() async {
    await tryCatch(ctx: context, function: Provider.of<CoinProvider>(context, listen: false).getCoins())
        .then((result) async {
      switch (result.response.state) {
        case true:
          setState(() => errorCode = '');
          await getMainSubscriptionNotificationCategories();
        case false:
          setState(() => errorCode = result.response.message);
          retryingCheck(response: result.response, func: getCoins);
      }
    });
  }

  getMainSubscriptionNotificationCategories() async {
    await tryCatch(
      ctx: context,
      function: Provider.of<MainSubscriptionNotificationCategoryProvider>(context, listen: false).getCategories(),
    ).then((result) async {
      switch (result.response.state) {
        case true:
          setState(() => errorCode = '');
          await getPlansCosts();
          break;
        case false:
          setState(() => errorCode = result.response.message);
          retryingCheck(response: result.response, func: getMainSubscriptionNotificationCategories);
          break;
      }
    });
  }

  getPlansCosts() async {
    await tryCatch(ctx: context, function: Provider.of<PlanCostProvider>(context, listen: false).getPlansCosts())
        .then((result) async {
      switch (result.response.state) {
        case true:
          setState(() => errorCode = '');
          await getPaymentCategory();
        case false:
          setState(() => errorCode = result.response.message);
          retryingCheck(response: result.response, func: getPlansCosts);
      }
    });
  }

  getPaymentCategory() async {
    await tryCatch(
            ctx: context, function: Provider.of<PaymentCategoryProvider>(context, listen: false).getPaymentCategories())
        .then((result) async {
      switch (result.response.state) {
        case true:
          setState(() => errorCode = '');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => const Home()),
          );
        case false:
          setState(() => errorCode = result.response.message);
          retryingCheck(response: result.response, func: getPaymentCategory);
      }
    });
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  checkLogin() async {
    await tryCatch(ctx: context, function: Provider.of<UserProvider>(context, listen: false).checkLoginInfo())
        .then((result) async {
      switch (result.response.state) {
        case true:
          User user = Provider.of<UserProvider>(context, listen: false).getUser;

          await getCountries(id: user.id.toString());

        case false:
          if (result.response.type == ReternedResponseType.mustNewLogin) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => Login()),
            );
          } else {
            retryingCheck(response: result.response, func: checkLogin);
          }
      }
    });
  }

  bool retrying = false;
  int counter = 5;

  retryingCheck({required ReternedResponse response, required Function func}) async {
    snackMessage(ctx: context, msg: response.message, color: red);
    setState(() => retrying = true);
    for (var i = 5; i > -1; i--) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() => counter = i);
    }
    setState(() {
      retrying = false;
      counter = 5;
    });
    func();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DigiBarTitle(),
            SizedBox(
              height: 50,
              child: Center(
                child: retrying
                    ? Text(
                        '$errorCode ${LocaleKeys.login_loginForm_validation_retryingAfter.tr()} $counter ${LocaleKeys.globalVocabulary_seconds.tr()}')
                    : const SizedBox(
                        height: 1.5,
                        width: 200,
                        child: LinearProgressIndicator(color: themeColor, minHeight: 0.5),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
