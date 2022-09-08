class APIEndpoint {
  static String get baseUrl => 'https://gesbuk-app.herokuapp.com';
  static String get apiUrl => '$baseUrl/api';
  static String get auth => '$apiUrl/auth';
  static String get user => '$apiUrl/user';
  static String get event => '$apiUrl/event';
}
