// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unidate/app/core/utils/datetime.util.dart';
import 'package:unidate/app/modules/profile/constant.dart';
import 'package:unidate/app/modules/profile/enums.dart';
part 'discovery.entity.g.dart';

@JsonSerializable()
class DiscoveryParam extends Equatable {
  bool onlyInDistance;
  bool onlyInAge;
  bool onlyInTall;
  bool onlyInWeight;
  bool onlyInEducation;
  int userSkip;

  DiscoveryParam({
    this.onlyInDistance = false,
    this.onlyInAge = false,
    this.onlyInTall = false,
    this.onlyInWeight = false,
    this.onlyInEducation = false,
    this.userSkip = whenLoadMore,
  });

  Map<String, dynamic> toJson() => _$DiscoveryParamToJson(this);

  factory DiscoveryParam.fromJson(Map<String, dynamic> json) =>
      _$DiscoveryParamFromJson(json);

  @override
  List<Object?> get props => [
        onlyInDistance,
        onlyInAge,
        onlyInTall,
        onlyInWeight,
        onlyInEducation,
      ];

  copyWith({
    bool? onlyInDistance,
    bool? onlyInAge,
    bool? onlyInTall,
    bool? onlyInWeight,
    bool? onlyInEducation,
    int? userSkip,
  }) {
    return DiscoveryParam(
      onlyInDistance: onlyInDistance ?? this.onlyInDistance,
      onlyInAge: onlyInAge ?? this.onlyInAge,
      onlyInTall: onlyInTall ?? this.onlyInTall,
      onlyInWeight: onlyInWeight ?? this.onlyInWeight,
      onlyInEducation: onlyInEducation ?? this.onlyInEducation,
      userSkip: userSkip ?? this.userSkip,
    );
  }
}

@JsonSerializableDateTime()
@JsonSerializable(createToJson: false)
class UserDiscoveryEntity {
  final int id;
  final int? age;
  final AcademicLevelEnum? education;
  final String? fullname;
  final double? distance;
  List<String> pictures;
  final String? avatar;
  bool isCanReconsider;
  bool isCanActions;

  UserDiscoveryEntity({
    required this.id,
    this.age,
    this.education,
    this.fullname,
    this.distance,
    this.pictures = const [],
    this.avatar,
    this.isCanReconsider = true,
    this.isCanActions = true,
  });

  UserDiscoveryEntity copyWith({
    int? id,
    int? age,
    AcademicLevelEnum? education,
    String? fullname,
    double? distance,
    List<String>? pictures,
    String? avatar,
    bool? isCanReconsider,
    bool? isCanActions,
  }) {
    return UserDiscoveryEntity(
      id: id ?? this.id,
      age: age ?? this.age,
      education: education ?? this.education,
      fullname: fullname ?? this.fullname,
      distance: distance ?? this.distance,
      pictures: pictures ?? this.pictures,
      avatar: avatar ?? this.avatar,
      isCanReconsider: isCanReconsider ?? this.isCanReconsider,
      isCanActions: isCanActions ?? this.isCanActions,
    );
  }

  factory UserDiscoveryEntity.fromJson(Map<String, dynamic> json) =>
      _$UserDiscoveryEntityFromJson(json);
}

@JsonSerializable(createFactory: false)
class MatchUserParam {
  final int matchUserId;
  final SwipeType type;

  MatchUserParam({
    required this.matchUserId,
    required this.type,
  });

  Map<String, dynamic> toJson() => _$MatchUserParamToJson(this);
}

@JsonSerializable(createToJson: false, explicitToJson: true)
class MatchUserEntity {
  final SwipeType type;
  final WhoEntity who;
  final int conversationId;

  MatchUserEntity({
    required this.who,
    required this.type,
    required this.conversationId,
  });

  factory MatchUserEntity.fromJson(Map<String, dynamic> json) =>
      _$MatchUserEntityFromJson(json);
}

@JsonSerializable(createToJson: false)
class WhoEntity {
  final String fullname;
  final String avatar;

  WhoEntity({
    required this.fullname,
    required this.avatar,
  });

  factory WhoEntity.fromJson(Map<String, dynamic> json) =>
      _$WhoEntityFromJson(json);
}

@JsonSerializableDateTime()
@JsonSerializable(createToJson: false)
class UserInfoDiscoveryEntity extends UserDiscoveryEntity {
  final int tall;
  final int weight;
  final String? biography;
  final GenderEnum gender;
  final List<WordIntoEnum> wordInto;

  UserInfoDiscoveryEntity({
    required this.tall,
    required this.weight,
    this.biography,
    required this.gender,
    required this.wordInto,
    required super.avatar,
    required super.id,
    required super.age,
    required super.fullname,
    required super.distance,
    required super.pictures,
    required super.education,
    super.isCanReconsider,
    super.isCanActions,
  });

  factory UserInfoDiscoveryEntity.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDiscoveryEntityFromJson(json);
}

@JsonSerializable()
class UserMatchFilterEntity extends Equatable {
  double maxDistance;
  double ageFrom;
  double ageTo;
  double tallFrom;
  double tallTo;
  double weightFrom;
  double weightTo;
  List<GenderEnum> whoWantToDate;
  List<AcademicLevelEnum> education;

  UserMatchFilterEntity({
    this.maxDistance = 20,
    this.ageFrom = 18,
    this.ageTo = 25,
    this.tallFrom = 150,
    this.tallTo = 200,
    this.weightFrom = 40,
    this.weightTo = 150,
    this.whoWantToDate = const [],
    this.education = const [],
  });

  Map<String, dynamic> toJson() => _$UserMatchFilterEntityToJson(this);

  factory UserMatchFilterEntity.fromJson(Map<String, dynamic> json) =>
      _$UserMatchFilterEntityFromJson(json);

  @override
  List<Object?> get props => [
        maxDistance,
        ageFrom,
        ageTo,
        tallFrom,
        tallTo,
        weightFrom,
        weightTo,
        whoWantToDate,
        education,
      ];
}
