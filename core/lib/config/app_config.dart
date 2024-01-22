class AppConfig {
  final Flavor flavor;
  final String baseUrlDjango;
  final String baseUrlGo;
  final String webSocketUrl;
  final String carrotApiKey;
  final String carrotAppId;
  final String carrotUserAuthKey;

  AppConfig({
    required this.flavor,
    required this.baseUrlDjango,
    required this.baseUrlGo,
    required this.webSocketUrl,
    required this.carrotApiKey,
    required this.carrotAppId,
    required this.carrotUserAuthKey,
  });

  factory AppConfig.fromFlavor(Flavor flavor) {
    String baseUrlDjango = '';
    String baseUrlGo = '';
    String webSocketUrl = '';
    const String carrotApiKey = String.fromEnvironment('CARROT_API_KEY');
    const String carrotAppId = String.fromEnvironment('CARROT_APP_ID');
    const String carrotUserAuthKey = String.fromEnvironment('CARROT_USER_AUTH_KEY');

    switch (flavor) {
      case Flavor.dev:
        baseUrlDjango = 'https://dev-api.liquidmining.com/';
        baseUrlGo = 'https://stage-site.liquidmining.com/api/';
        webSocketUrl = '';
        break;
      case Flavor.prod:
        baseUrlDjango = 'https://dev-api.liquidmining.com/';
        baseUrlGo = 'https://stage-site.liquidmining.com/api/';
        webSocketUrl = '';
        break;
      case Flavor.stage:
        baseUrlDjango = 'https://dev-api.liquidmining.com/';
        baseUrlGo = 'https://stage-site.liquidmining.com/api/';
        webSocketUrl = '';
        break;
      case Flavor.qa:
        baseUrlDjango = 'https://dev-api.liquidmining.com/';
        baseUrlGo = 'https://stage-site.liquidmining.com/api/';
        webSocketUrl = '';
        break;
    }

    return AppConfig(
      flavor: flavor,
      baseUrlDjango: baseUrlDjango,
      baseUrlGo: baseUrlGo,
      webSocketUrl: webSocketUrl,
      carrotApiKey: carrotApiKey,
      carrotAppId: carrotAppId,
      carrotUserAuthKey: carrotUserAuthKey,
    );
  }
}

enum Flavor {
  dev,
  prod,
  stage,
  qa;

  static Flavor fromString(String flavor) {
    switch (flavor) {
      case 'dev':
        return Flavor.dev;
      case 'prod':
        return Flavor.prod;
      case 'stage':
        return Flavor.stage;
      case 'test':
        return Flavor.qa;
      default:
        return Flavor.dev;
    }
  }
}
