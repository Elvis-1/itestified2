import '../service_locators.dart' as service_locator;

//import 'package:get_it/get_it.dart' as service_locator;
enum Environment { dev, prod, mock }

class AppConfig {
  //https://itestify-mobile-backend.onrender.com/auth/register
  AppConfig._();
  static const baseUrl = 'https://itestify-backend-nxel.onrender.com';
  static Environment environment = Environment.prod;

  // init dependencies needed during the runApp process
  static Future<void> initDependencies({
    Environment environment = Environment.prod,
  }) async {
    AppConfig.environment = environment;
    if (environment == Environment.mock) return;
    // set the environment to be used
    AppConfig.setEnvironment(environment);
    // init service locator
    await service_locator.setupLocator();
  }

  // constants values to be given based on the environment set
  static Map<String, String>? _constants;

  // set the environment to run the app in
  static void setEnvironment(Environment environment) {
    AppConfig.environment = environment;
    switch (environment) {
      case Environment.dev:
        _constants = _Constants.devConstants;
        break;
      case Environment.prod:
        _constants = _Constants.prodConstants;
        break;
      case Environment.mock:
        break;
    }
  }

  // base url based on the environment set
  // static String get baseUrl {
  //   return 'http://167.71.30.185:8000/frontend/v1';
  //   // return _constants?[_Constants.baseUrl]! ?? '';
  // }

  // app name based on the environment set
  static String get appName {
    return _constants?[_Constants.appName]! ?? '';
  }

  //website URL that we will use in places like Webview to check for redirect URL
  static String get websiteUrl {
    return _constants?[_Constants.websiteUrl]! ?? '';
  }
}

// holds environment specific variables
class _Constants {
  static const baseUrl = 'MONEY_SWAP_BASE_URL';
  static const appName = 'APP_NAME';
  static const websiteUrl = 'MONEY_SWAP_WEBSITE_URL';

  static Map<String, String> devConstants = {
    baseUrl: 'http://167.71.30.185:8000/frontend/v1/',
    appName: 'Moneyswap',
    websiteUrl: ''
  };

  static Map<String, String> prodConstants = {
    baseUrl: 'http://167.71.30.185:8000/frontend/v1/',
    appName: 'Moneyswap',
    websiteUrl: '',
  };
}
