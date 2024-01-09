// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoveryParam _$DiscoveryParamFromJson(Map<String, dynamic> json) =>
    DiscoveryParam(
      onlyInDistance: json['onlyInDistance'] as bool? ?? false,
      onlyInAge: json['onlyInAge'] as bool? ?? false,
      onlyInTall: json['onlyInTall'] as bool? ?? false,
      onlyInWeight: json['onlyInWeight'] as bool? ?? false,
      onlyInEducation: json['onlyInEducation'] as bool? ?? false,
      userSkip: json['userSkip'] as int? ?? whenLoadMore,
    );

Map<String, dynamic> _$DiscoveryParamToJson(DiscoveryParam instance) =>
    <String, dynamic>{
      'onlyInDistance': instance.onlyInDistance,
      'onlyInAge': instance.onlyInAge,
      'onlyInTall': instance.onlyInTall,
      'onlyInWeight': instance.onlyInWeight,
      'onlyInEducation': instance.onlyInEducation,
      'userSkip': instance.userSkip,
    };

UserDiscoveryEntity _$UserDiscoveryEntityFromJson(Map<String, dynamic> json) =>
    UserDiscoveryEntity(
      id: json['id'] as int,
      age: json['age'] as int?,
      education:
          $enumDecodeNullable(_$AcademicLevelEnumEnumMap, json['education']),
      fullname: json['fullname'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      pictures: (json['pictures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      avatar: json['avatar'] as String?,
      isCanReconsider: json['isCanReconsider'] as bool? ?? true,
      isCanActions: json['isCanActions'] as bool? ?? true,
      isVerified: json['isVerified'] as bool? ?? false,
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
      conversationId: json['conversationId'] as int,
    );

WhoEntity _$WhoEntityFromJson(Map<String, dynamic> json) => WhoEntity(
      fullname: json['fullname'] as String,
      avatar: json['avatar'] as String,
    );

UserInfoDiscoveryEntity _$UserInfoDiscoveryEntityFromJson(
        Map<String, dynamic> json) =>
    UserInfoDiscoveryEntity(
      tall: json['tall'] as int,
      weight: json['weight'] as int,
      biography: json['biography'] as String?,
      gender: $enumDecode(_$GenderEnumEnumMap, json['gender']),
      wordInto: (json['wordInto'] as List<dynamic>)
          .map((e) => $enumDecode(_$WordIntoEnumEnumMap, e))
          .toList(),
      avatar: json['avatar'] as String?,
      id: json['id'] as int,
      age: json['age'] as int?,
      fullname: json['fullname'] as String?,
      distance: (json['distance'] as num?)?.toDouble(),
      pictures: (json['pictures'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      education:
          $enumDecodeNullable(_$AcademicLevelEnumEnumMap, json['education']),
      isCanReconsider: json['isCanReconsider'] as bool? ?? true,
      isCanActions: json['isCanActions'] as bool? ?? true,
      isVerified: json['isVerified'] as bool? ?? false,
    );

const _$GenderEnumEnumMap = {
  GenderEnum.Man: 'Man',
  GenderEnum.Woman: 'Woman',
  GenderEnum.Other: 'Other',
};

const _$WordIntoEnumEnumMap = {
  WordIntoEnum.Sport: 'Sport',
  WordIntoEnum.Music: 'Music',
  WordIntoEnum.Movie: 'Movie',
  WordIntoEnum.Book: 'Book',
  WordIntoEnum.Game: 'Game',
  WordIntoEnum.Travel: 'Travel',
  WordIntoEnum.Food: 'Food',
  WordIntoEnum.Art: 'Art',
  WordIntoEnum.Science: 'Science',
  WordIntoEnum.Technology: 'Technology',
  WordIntoEnum.Business: 'Business',
  WordIntoEnum.Politics: 'Politics',
  WordIntoEnum.Fashion: 'Fashion',
  WordIntoEnum.Beauty: 'Beauty',
  WordIntoEnum.Health: 'Health',
  WordIntoEnum.Fitness: 'Fitness',
  WordIntoEnum.Lifestyle: 'Lifestyle',
  WordIntoEnum.Relationship: 'Relationship',
  WordIntoEnum.Family: 'Family',
  WordIntoEnum.Education: 'Education',
  WordIntoEnum.Career: 'Career',
  WordIntoEnum.Money: 'Money',
  WordIntoEnum.Home: 'Home',
  WordIntoEnum.Garden: 'Garden',
  WordIntoEnum.Pet: 'Pet',
  WordIntoEnum.Car: 'Car',
  WordIntoEnum.Motorcycle: 'Motorcycle',
  WordIntoEnum.SportCar: 'SportCar',
  WordIntoEnum.Other: 'Other',
};

UserMatchFilterEntity _$UserMatchFilterEntityFromJson(
        Map<String, dynamic> json) =>
    UserMatchFilterEntity(
      maxDistance: (json['maxDistance'] as num?)?.toDouble() ?? 20,
      ageFrom: (json['ageFrom'] as num?)?.toDouble() ?? 18,
      ageTo: (json['ageTo'] as num?)?.toDouble() ?? 25,
      tallFrom: (json['tallFrom'] as num?)?.toDouble() ?? 150,
      tallTo: (json['tallTo'] as num?)?.toDouble() ?? 200,
      weightFrom: (json['weightFrom'] as num?)?.toDouble() ?? 40,
      weightTo: (json['weightTo'] as num?)?.toDouble() ?? 150,
      whoWantToDate: (json['whoWantToDate'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$GenderEnumEnumMap, e))
              .toList() ??
          const [],
      education: (json['education'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$AcademicLevelEnumEnumMap, e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserMatchFilterEntityToJson(
        UserMatchFilterEntity instance) =>
    <String, dynamic>{
      'maxDistance': instance.maxDistance,
      'ageFrom': instance.ageFrom,
      'ageTo': instance.ageTo,
      'tallFrom': instance.tallFrom,
      'tallTo': instance.tallTo,
      'weightFrom': instance.weightFrom,
      'weightTo': instance.weightTo,
      'whoWantToDate':
          instance.whoWantToDate.map((e) => _$GenderEnumEnumMap[e]!).toList(),
      'education': instance.education
          .map((e) => _$AcademicLevelEnumEnumMap[e]!)
          .toList(),
    };
