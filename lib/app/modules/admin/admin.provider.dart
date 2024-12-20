import 'package:unidate/app/core/http/helper.http.dart';
import 'package:unidate/app/modules/admin/entities/admin.entity.dart';

class AdminProviders {
  AdminProviders();

  Future<List<VerifyUserEntity>> verifyUsers(VerifyUserParam data) async {
    try {
      final res = await AppHttpHelper.instance.get(
        'admin/verify-users',
        queryParameters: data.toJson(),
      );

      return res.data
          .map<VerifyUserEntity>((e) => VerifyUserEntity.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> verifyUser(VerifyUserParam data) async {
    try {
      await AppHttpHelper.instance.post(
        'admin/verify-users/${data.id}',
        data: data.toJson(),
      );

      return;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserSystemEntity>> users(String? searchKey) async {
    try {
      final res = await AppHttpHelper.instance.get(
        'admin/user-system',
        queryParameters: {
          'searchKey': searchKey,
        },
      );
      return res.data
          .map<UserSystemEntity>((e) => UserSystemEntity.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
