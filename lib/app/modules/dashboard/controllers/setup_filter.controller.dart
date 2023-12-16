import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:unidate/app/data/entities/match.entity.dart';
import 'package:unidate/app/data/providers/match.provider.dart';
import 'package:unidate/app/modules/profile/enums.dart';

class SetupFilterController extends GetxController {
  final MatchProvider _matchProvider = MatchProvider();

  DiscoveryParam _initFilterRequired = DiscoveryParam();
  final Rx<DiscoveryParam> _filterRequired = DiscoveryParam().obs;
  DiscoveryParam get filterRequired => _filterRequired.value;

  UserMatchFilterEntity _initFilter = UserMatchFilterEntity();
  final Rx<UserMatchFilterEntity> _filter = UserMatchFilterEntity().obs;
  UserMatchFilterEntity get filter => _filter.value;

  TextEditingController genderController = TextEditingController();
  TextEditingController educationController = TextEditingController();

  RxBool isLoading = true.obs;

  RxBool isSubmitted = false.obs;

  bool get isCanApply =>
      filterRequired != _initFilterRequired || filter != _initFilter;

  @override
  void onInit() {
    super.onInit();
    _filterRequired(Get.arguments as DiscoveryParam);
    _initFilterRequired = Get.arguments as DiscoveryParam;
    getFilter();
  }

  Future<void> getFilter() async {
    try {
      final res = await _matchProvider.getFilter();
      _filter.value = res;
      _initFilter = UserMatchFilterEntity.fromJson(res.toJson());
      genderController.text =
          _filter.value.whoWantToDate.map((e) => e.name).join(', ');
      educationController.text = filter.education.map((e) => e.name).join(', ');
    } catch (e) {
      rethrow;
    }
    isLoading.value = false;
  }

  Future<void> updateFilterRequired() async {
    try {
      final box = GetStorage();
      box.write('filterParam', filterRequired.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateFilter() async {
    try {
      isSubmitted(true);
      await _matchProvider.updateFilter(filter);
      updateFilterRequired();
      Get.back(result: filterRequired);
    } catch (e) {
      rethrow;
    }
    isSubmitted(false);
  }

  void setFilterRequired(DiscoveryParam filter) {
    _filterRequired.value = filter;
  }

  void setFilter(UserMatchFilterEntity filter) {
    _filter.value = filter;
  }

  void onChangedOnlyInDistance(bool value) {
    _filterRequired.update((val) {
      val!.onlyInDistance = value;
    });
  }

  void onChangedOnlyInAge(bool value) {
    _filterRequired.update((val) {
      val!.onlyInAge = value;
    });
  }

  void onChangedOnlyInTall(bool value) {
    _filterRequired.update((val) {
      val!.onlyInTall = value;
    });
  }

  void onChangedOnlyInWeight(bool value) {
    _filterRequired.update((val) {
      val!.onlyInWeight = value;
    });
  }

  void onChangedOnlyInEducation(bool value) {
    _filterRequired.update((val) {
      val!.onlyInEducation = value;
    });
  }

  void onChangedDistance(dynamic value) {
    _filter.update((val) {
      val!.maxDistance = value;
    });
  }

  void onChangedAgeFrom(dynamic value) {
    _filter.update((val) {
      val!.ageFrom = value;
    });
  }

  void onChangedAgeTo(dynamic value) {
    _filter.update((val) {
      val!.ageTo = value;
    });
  }

  void onChangedTallFrom(dynamic value) {
    _filter.update((val) {
      val!.tallFrom = value;
    });
  }

  void onChangedTallTo(dynamic value) {
    _filter.update((val) {
      val!.tallTo = value;
    });
  }

  void onChangedWeightFrom(dynamic value) {
    _filter.update((val) {
      val!.weightFrom = value;
    });
  }

  void onChangedWeightTo(dynamic value) {
    _filter.update((val) {
      val!.weightTo = value;
    });
  }

  void onChangedWhoWantToDate(GenderEnum value) {
    if (_filter.value.whoWantToDate.contains(value)) {
      _filter.update((val) {
        val!.whoWantToDate.remove(value);
      });
    } else {
      _filter.update((val) {
        val!.whoWantToDate.add(value);
      });
    }
    genderController.text =
        _filter.value.whoWantToDate.map((e) => e.name).join(', ');
  }

  void onChangedMatcherEducation(AcademicLevelEnum value) {
    if (filter.education.contains(value)) {
      _filter.update((val) {
        val!.education.remove(value);
      });
    } else {
      _filter.update((val) {
        val!.education.add(value);
      });
    }
    educationController.text = filter.education.map((e) => e.name).join(', ');
  }
}
