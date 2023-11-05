/// Contributors:
/// * Sang Pham - phsang49@gmail.com
///
/// Created time: 05/01/2023,
/// Last updated: 05/01/2023,
/// Number of updates: 0
///
/// PR number:
/// * #11 - Apply OOPs
///
/// Description:
/// * This class contains all the urls that do not need to be authenticated.
class AppHttpSpecialUrls {
  const AppHttpSpecialUrls._();

  static const String _baseUrl = '/api/v1';
  static const String _baseAuthUrl = '$_baseUrl/auth';

  static const List<String> withoutToken = [
    '$_baseUrl/',
    '$_baseAuthUrl/login',
    '$_baseAuthUrl/register',
    '$_baseAuthUrl/refresh-token',
    '$_baseAuthUrl/forgot-password',
  ];
}
