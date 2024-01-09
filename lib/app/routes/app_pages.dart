import 'package:get/get.dart';
import 'package:unidate/app/bindings/setup_profile.binding.dart';
import 'package:unidate/app/modules/admin/views/admin_base.view.dart';
import 'package:unidate/app/modules/conversations/views/messages.view.dart';
import 'package:unidate/app/modules/dicoveries/views/matched.view.dart';
import 'package:unidate/app/modules/dicoveries/views/setup_filter.view.dart';
import 'package:unidate/app/modules/auth/views/setup/add_pictures.view.dart';
import 'package:unidate/app/modules/profile/views/notification.view.dart';
import '../bindings/manager.binding.dart';
import '../modules/auth/views/login.view.dart';
import '../modules/auth/views/register.view.dart';
import '../modules/dicoveries/views/detail_user.view.dart';
import '../modules/auth/views/setup/add_words_into.view.dart';
import '../modules/auth/views/setup/location.view.dart';
import '../modules/auth/views/setup/setup_profile.view.dart';
import '../modules/auth/views/welcome.view.dart';
import '../modules/dashboard/dashboard.view.dart';
import '../modules/auth/views/setup/update_bio.view.dart';

import '../bindings/dashboard.binding.dart';
import '../bindings/auth.binding.dart';
import '../modules/auth/views/waiting.view.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.AUTH;

  static final routes = [
    GetPage(
      name: AppRoutes.AUTH,
      page: () => const WaitingView(),
      binding: ManagerBinding(),
    ),
    //
    GetPage(
      name: AppRoutes.WELCOME,
      page: () => const WelcomeView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => const RegisterView(),
      binding: AuthBinding(),
    ),
    //
    GetPage(
      name: AppRoutes.SETUP_BIO,
      page: () => const UpdateBioScreen(),
      binding: SetupProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.SETUP_PICTURES,
      page: () => const AddPicturesView(),
      binding: SetupProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.SETUP_LOCATION,
      page: () => const RequestLocationView(),
      binding: SetupProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.SETUP_PROFILE,
      page: () => const SetupProfileView(),
      binding: SetupProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.SETUP_WORDSINTO,
      page: () => const AddWordsIntoView(),
      binding: SetupProfileBinding(),
    ),

    //
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => const DashBoardView(),
      binding: DashBoardBinding(),
    ),
    //
    GetPage(
      name: AppRoutes.PROFILE_DETAIL,
      page: () => const DetailUserView(),
    ),
    GetPage(
      name: AppRoutes.MATCHED,
      page: () => const MatchedView(),
    ),
    GetPage(
      name: AppRoutes.SETUP_FILTER,
      page: () => const SetupFilterView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.MESSAGES,
      page: () => const MessagesView(),
    ),
    GetPage(
      name: AppRoutes.NOTIFICATIONS,
      page: () => const NotificationView(),
    ),

    //
    GetPage(
      name: AppRoutes.ADMIN,
      page: () => const AdminBaseView(),
    ),
  ];
}
