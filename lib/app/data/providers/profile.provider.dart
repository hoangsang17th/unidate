import 'package:unidate/app/core/http/helper.http.dart';
import 'package:unidate/app/data/entities/user.entity.dart';

class ProfileProviders {
  ProfileProviders();

  Future<NextStepEntity> updateBio(String bio) async {
    try {
      final response = await AppHttpHelper.instance.post(
        'auth/register',
        data: {
          'biography': bio,
        },
      );
      return NextStepEntity.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<NextStepEntity> updateProfile(UpdateProfileEntity data) async {
    try {
      final response = await AppHttpHelper.instance.post(
        'auth/login',
        data: data.toJson(),
      );
      return NextStepEntity.fromJson(response.data);
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
}
