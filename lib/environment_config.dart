class EnvironmentConfig {
  static const BASE_URL = String.fromEnvironment('BASE_URL',
      defaultValue: "http://150.95.30.152:8080/primary");
}