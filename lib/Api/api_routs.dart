class BaseService {
  static const String baseUrl = 'https://uis.sataware.dev/api';

  static const String registerUrl = '$baseUrl/register';
  static const String loginUrl = '$baseUrl/login';

  ///form
  static const String getAllFormsUrl = '$baseUrl/forms';
  static const String getSingleFormUrl = '$baseUrl/forms/single';

  ///static const String getSingleFormUrl = '$baseUrl/forms/single/8/4';
}
