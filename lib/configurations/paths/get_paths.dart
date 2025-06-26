import '../consts/consts.dart';

// User
String loginUrl = '$login/login$ext';
String checkLoginUrl = '$login/checkLogin$ext';
String modifyPasswordUrl = '$login/modifyPassword$ext';

// Country
String getClerkCountriesUrl = '$country/getClerkCountries$ext';

// City
String getCitiesUrl = '$city/getClerkCities$ext';

// clientClassification
String getClientClassificationUrl = '$clientClassification/getClientClassification$ext';

// clientCategory
String getClientCategoryUrl = '$clientCategory/getClientCategory$ext';

// Clerk
String getClerksUrl = '$city$get/getClerks$ext';
String uploadClerkImageUrl = '$clerk/uploadClerkImage$ext';

// Plan
String getPlansClassesUrl = '$plan/getPlansClasses$ext';
String getPlanCostsUrl = '$plan/getPlanCosts$ext';
// Duration
String getPlansDurationsUrl = '$plan/getPlansDurations$ext';
// Coin
String getPlanCoinsUrl = '$plan/getPlanCoins$ext';

// subscription
String newSubscriptionUrl = '$subscription$insert/newSubscription$ext';

//payments
String getPaymentCategoriesUrl = '$general/payments$get/getPaymentCategories$ext';

// mainSubscriptionNotificationCategory
String getMainSubscriptionNotificationCategoriesUrl = '$category$get/getMainSubscriptionNotificationCategory$ext';
