import 'package:unidate/app/core/http/helper.http.dart';
import 'package:unidate/app/data/entities/user.entity.dart';

class ProfileProviders {
  ProfileProviders();

  Future<NextStepEntity> updateBio(String bio) async {
    try {
      final response = await AppHttpHelper.instance.put(
        'users/bio',
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
      final response = await AppHttpHelper.instance.put(
        'users/profile',
        data: data.toJson(),
      );
      return NextStepEntity.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<NextStepEntity> addPictures(PicturesEntity data) async {
    try {
      final response = await AppHttpHelper.instance.post(
        'users/add-pictures',
        formData: data.toJson(),
      );
      return NextStepEntity.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
