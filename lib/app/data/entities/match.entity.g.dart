// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$DiscoveryParamToJson(DiscoveryParam instance) =>
    <String, dynamic>{
      'onlyInDistanse': instance.onlyInDistanse,
      'onlyInAge': instance.onlyInAge,
      'onlyInTall': instance.onlyInTall,
      'onlyInWeight': instance.onlyInWeight,
      'onlyInEducation': instance.onlyInEducation,
    };

UserDiscoveryEntity _$UserDiscoveryEntityFromJson(Map<String, dynamic> json) =>
    UserDiscoveryEntity(
      id: json['id'] as int,
      age: json['age'] as int,
      education:
          $enumDecodeNullable(_$AcademicLevelEnumEnumMap, json['education']),
      fullname: json['fullname'] as String,
      distance: (json['distance'] as num).toDouble(),
      pictures:
          (json['pictures'] as List<dynamic>).map((e) => e as String).toList(),
    );

const _$AcademicLevelEnumEnumMap = {
  AcademicLevelEnum.BachelorDegree: 'BachelorDegree',
  AcademicLevelEnum.AtUni: 'AtUni',
  AcademicLevelEnum.HighSchool: 'HighSchool',
  AcademicLevelEnum.PhD: 'PhD',
  AcademicLevelEnum.OnAGraduateCourse: 'OnAGraduateCourse',
  AcademicLevelEnum.MasterDegree: 'MasterDegree',
  AcademicLevelEnum.TradeSchool: 'TradeSchool',
  AcademicLevelEnum.Other: 'Other',
};

Map<String, dynamic> _$MatchUserParamToJson(MatchUserParam instance) =>
    <String, dynamic>{
      'matchUserId': instance.matchUserId,
      'type': _$SwipeTypeEnumMap[instance.type]!,
    };

const _$SwipeTypeEnumMap = {
  SwipeType.Dislike: 'Dislike',
  SwipeType.Like: 'Like',
  SwipeType.Reconsider: 'Reconsider',
  SwipeType.None: 'None',
};

MatchUserEntity _$MatchUserEntityFromJson(Map<String, dynamic> json) =>
    MatchUserEntity(
      who: WhoEntity.fromJson(json['who'] as Map<String, dynamic>),
      type: $enumDecode(_$SwipeTypeEnumMap, json['type']),
    );

WhoEntity _$WhoEntityFromJson(Map<String, dynamic> json) => WhoEntity(
      fullname: json['fullname'] as String,
      avatar: json['avatar'] as String,
    );
