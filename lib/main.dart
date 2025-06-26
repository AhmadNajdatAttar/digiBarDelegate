import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'configurations/consts/consts.dart';
import 'providers/app_theme_provider.dart';
import 'providers/city_provider.dart';
import 'providers/client_category_provider.dart';
import 'providers/client_classification_provider.dart';
import 'providers/coin_provider.dart';
import 'providers/country_provider.dart';
import 'providers/main_subscription_notification_category_provider.dart';
import 'providers/main_subscription_provider.dart';
import 'providers/new_main_subscription_provider.dart';
import 'providers/payment_category_provider.dart';
import 'providers/plan_class_provider.dart';
import 'providers/plan_cost_provider.dart';
import 'providers/plan_duratioin_provider.dart';
import 'providers/support_plan_provider.dart';
import 'providers/user_provider.dart';
import 'widgets/start/digi_bar_delegate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),
        ChangeNotifierProvider(create: (context) => CountryProvider()),
        ChangeNotifierProvider(create: (context) => CityProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ClientCategoryProvider()),
        ChangeNotifierProvider(create: (context) => ClientClassificationProvider()),
        ChangeNotifierProvider(create: (context) => PlanDurationProvider()),
        ChangeNotifierProvider(create: (context) => PlanClassProvider()),
        ChangeNotifierProvider(create: (context) => PlanCostProvider()),
        ChangeNotifierProvider(create: (context) => SupportPlanProvider()),
        ChangeNotifierProvider(create: (context) => PaymentCategoryProvider()),
        ChangeNotifierProvider(create: (context) => CoinProvider()),
        ChangeNotifierProvider(create: (context) => MainSubscriptionNotificationCategoryProvider()),
        ChangeNotifierProvider(create: (context) => NewMainSubscriptionProvider()),
        ChangeNotifierProvider(create: (context) => MainSubscriptionProvider()),
      ],
      child: EasyLocalization(
        path: localizationPath,
        supportedLocales: locales,
        fallbackLocale: fallbackLocale,
        assetLoader: assetLoader,
        useOnlyLangCode: true,
        saveLocale: true,
        child: const DigiBarDelegate(),
      ),
    ),
  );
}
