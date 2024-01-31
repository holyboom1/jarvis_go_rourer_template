class AppConfig {
  final Flavor flavor;
  final String baseUrl;
  final String webSocketUrl;

  AppConfig({
    required this.flavor,
    required this.baseUrl,
    required this.webSocketUrl,
  });

  factory AppConfig.fromFlavor(Flavor flavor) {
    String baseUrl = '';
    String webSocketUrl = '';

    switch (flavor) {
      case Flavor.dev:
        baseUrl = 'https://dev-api.liquidmining.com/';
        webSocketUrl = '';
        break;
      case Flavor.prod:
        baseUrl = 'https://dev-api.liquidmining.com/';
        webSocketUrl = '';
        break;
      case Flavor.stage:
        baseUrl = 'https://dev-api.liquidmining.com/';
        webSocketUrl = '';
        break;
      case Flavor.qa:
        baseUrl = 'https://dev-api.liquidmining.com/';
        webSocketUrl = '';
        break;
    }

    return AppConfig(
      flavor: flavor,
      baseUrl: baseUrl,
      webSocketUrl: webSocketUrl,
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
