import 'package:json_annotation/json_annotation.dart';
import 'package:unidate/app/core/utils/datetime.util.dart';
import 'package:unidate/app/modules/profile/enums.dart';
part 'match.entity.g.dart';

@JsonSerializable(createFactory: false)
class DiscoveryParam {
  bool onlyInDistanse;
  bool onlyInAge;
  bool onlyInTall;
  bool onlyInWeight;
  bool onlyInEducation;

  DiscoveryParam({
    this.onlyInDistanse = false,
    this.onlyInAge = false,
    this.onlyInTall = false,
    this.onlyInWeight = false,
    this.onlyInEducation = false,
  });

  Map<String, dynamic> toJson() => _$DiscoveryParamToJson(this);
}

@JsonSerializableDateTime()
@JsonSerializable(createToJson: false)
class UserDiscoveryEntity {
  final int id;
  final int age;
  final AcademicLevelEnum? education;
  final String fullname;
  final double distance;
  List<String> pictures;

  UserDiscoveryEntity({
    required this.id,
    required this.age,
    this.education,
    required this.fullname,
    required this.distance,
    required this.pictures,
  });

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
 

  MatchUserEntity({
    required this.who,
    required this.type,
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

// @JsonSerializableDateTime()
// @JsonSerializable(createToJson: false)
// class UserDiscoveryEntity {
//   final int id;
//   final String? biography;
//   final DateTime? birthday;
//   final AcademicLevelEnum? education;
//   final String fullname;
//   final double distance;
//   final GenderEnum gender;
//   final int tall;
//   final int weight;
//   final List<WordIntoEnum> wordsInto;
//   List<String> pictures;

//   UserDiscoveryEntity({
//     required this.id,
//     this.biography,
//     this.birthday,
//     this.education,
//     required this.fullname,
//     required this.distance,
//     required this.gender,
//     required this.tall,
//     required this.weight,
//     required this.wordsInto,
//     required this.pictures,
//   });

//   factory UserDiscoveryEntity.fromJson(Map<String, dynamic> json) =>
//       _$UserDiscoveryEntityFromJson(json);
// }
