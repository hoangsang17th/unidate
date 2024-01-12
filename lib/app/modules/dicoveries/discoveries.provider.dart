import 'package:unidate/app/core/http/helper.http.dart';
import 'package:unidate/app/modules/dicoveries/entities/discovery.entity.dart';

class DiscoveriesProvider {
  DiscoveriesProvider();

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
      rethrow;
    }
  }

  Future<List<UserDiscoveryEntity>> getWhoLikedMe() async {
    try {
      final res = await AppHttpHelper.instance.get(
        'matches/get-who-liked-me',
      );
      return res.data
          .map<UserDiscoveryEntity>((e) => UserDiscoveryEntity.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserDiscoveryEntity>> getMyReconsider() async {
    try {
      final res = await AppHttpHelper.instance.get(
        'matches/my-reconsider',
      );
      return res.data
          .map<UserDiscoveryEntity>((e) => UserDiscoveryEntity.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<UserMatchFilterEntity> getFilter() async {
    try {
      final res = await AppHttpHelper.instance.get(
        'matches/filter',
      );
      return UserMatchFilterEntity.fromJson(res.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateFilter(UserMatchFilterEntity filter) async {
    try {
      await AppHttpHelper.instance.put(
        'matches/filter',
        data: filter.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

    Future<List<UserDiscoveryEntity>> getDiscoveriesMax() async {
    try {
      final response = await AppHttpHelper.instance.get(
        'matches/discoveries-recently',
        queryParameters: {
          'maxDistance': 10
        },
      );
      return response.data
          .map<UserDiscoveryEntity>((e) => UserDiscoveryEntity.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

}
