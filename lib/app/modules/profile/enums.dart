// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unidate/app/routes/app_pages.dart';

@JsonEnum()
enum UserStepSetup {
  Bio,
  Profile,
  Pictures,
  WordInto,
  Location,

  Done;

  void navigation() {
    switch (this) {
      case Bio:
        Get.offAllNamed(AppRoutes.SETUP_BIO);

        break;
      case Profile:
        Get.offAllNamed(AppRoutes.SETUP_PROFILE);

        break;
      case Pictures:
        Get.offAllNamed(AppRoutes.SETUP_PICTURES);

        break;
      case Location:
        Get.offAllNamed(AppRoutes.SETUP_LOCATION);

        break;
      case WordInto:
        Get.offAllNamed(AppRoutes.SETUP_WORDSINTO);

        break;
      default:
        Get.offAllNamed(AppRoutes.DASHBOARD);
    }
  }
}

@JsonEnum()
enum GenderEnum { Man, Woman, Other }

@JsonEnum()
enum AcademicLevelEnum {
  BachelorDegree,
  AtUni,
  HighSchool,
  PhD,
  OnAGraduateCourse,
  MasterDegree,
  TradeSchool,
  Other;

  String get name {
    switch (this) {
      case BachelorDegree:
        return 'Bachelor\'s degree';
      case AtUni:
        return 'At university';
      case HighSchool:
        return 'High school';
      case PhD:
        return 'PhD';
      case OnAGraduateCourse:
        return 'On a graduate course';
      case MasterDegree:
        return 'Master\'s degree';
      case TradeSchool:
        return 'Trade school';

      default:
        return 'Other';
    }
  }
}

@JsonEnum()
enum WordIntoEnum {
  Sport,
  Music,
  Movie,
  Book,
  Game,
  Travel,
  Food,
  Art,
  Science,
  Technology,
  Business,
  Politics,
  Fashion,
  Beauty,
  Health,
  Fitness,
  Lifestyle,
  Relationship,
  Family,
  Education,
  Career,
  Money,
  Home,
  Garden,
  Pet,
  Car,
  Motorcycle,
  SportCar,
  Other;

  String get newName {
    switch (this) {
      case Relationship:
        return 'Relationships';
      case Motorcycle:
        return 'Motorcycles';
      case SportCar:
        return 'Sport cars';

      default:
        return name;
    }
  }
}

@JsonEnum()
enum SwipeType { Dislike, Like, Reconsider, None }