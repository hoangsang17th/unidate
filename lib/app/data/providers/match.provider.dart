import 'package:unidate/app/core/http/helper.http.dart';
import 'package:unidate/app/data/entities/match.entity.dart';

class MatchProvider {
  MatchProvider();

  Future<List<UserDiscoveryEntity>> getDiscoveries(DiscoveryParam param) async {
    try {
      final response = await AppHttpHelper.instance.get(
        'matches/discoveries',
        queryParameters: param.toJson(),
      );
      return response.data
          .map<UserDiscoveryEntity>((e) => UserDiscoveryEntity.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<MatchUserEntity?> match(MatchUserParam param) async {
    try {
      final res = await AppHttpHelper.instance.post(
        'matches/match',
        data: param.toJson(),
      );
      return res.data != null ? MatchUserEntity.fromJson(res.data) : null;
    } catch (e) {
      return null;
    }
  }

  Future<UserInfoDiscoveryEntity> getUserInfo(int userId) async {
    try {
      final res = await AppHttpHelper.instance.get(
        'matches/user-info?userId=$userId',
      );
      return UserInfoDiscoveryEntity.fromJson(res.data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
// - Discover
// - Match
//     - Like
//         - matched with someone
//             - create chat
//     - Dislike
//     - Reconsider
// - Get User Detail
// - Revert match
}