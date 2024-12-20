import 'package:unidate/app/core/http/helper.http.dart';
import 'package:unidate/app/modules/auth/entities/user.entity.dart';

class UserProviders {
  UserProviders();

  Future<LoginResponseEntity> register(RegisterEntity data) async {
    try {
      final response = await AppHttpHelper.instance.post(
        'auth/register',
        formData: data.toJson(),
      );
      return LoginResponseEntity.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginResponseEntity> login(LoginEntity data) async {
    try {
      final response = await AppHttpHelper.instance.post(
        'auth/login',
        data: data.toJson(),
      );
      return LoginResponseEntity.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<CurrentUserEntity> currentUser() async {
    try {
      final response = await AppHttpHelper.instance.get('users/current');
      return CurrentUserEntity.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> requestVerify() async {
    try {
      await AppHttpHelper.instance.post('users/request-verify');
      return;
    } catch (e) {
      rethrow;
    }
  }
}
