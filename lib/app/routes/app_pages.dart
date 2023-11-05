import 'package:get/get.dart';
import '../bindings/manager.binding.dart';
import '../modules/auth/views/login.view.dart';
import '../modules/auth/views/register.view.dart';
import '../modules/profile/views/profile.view.dart';
import '../modules/profile/views/setup/add_words_into.view.dart';
import '../modules/profile/views/setup/location.view.dart';
import '../modules/profile/views/setup/setup_profile.view.dart';
import '../modules/auth/views/welcome.view.dart';
import '../modules/dashboard/views/dashboard.view.dart';
import '../modules/profile/views/setup/update_bio.view.dart';

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
      page: () => UpdateBioScreen(),
    ),
    GetPage(
      name: AppRoutes.SETUP_PICTURES,
      page: () => const SetupProfileView(),
    ),
    GetPage(
      name: AppRoutes.SETUP_LOCATION,
      page: () => const RequestLocationView(),
    ),
    GetPage(
      name: AppRoutes.SETUP_PROFILE,
      page: () => const SetupProfileView(),
    ),
    GetPage(
      name: AppRoutes.SETUP_WORDSINTO,
      page: () => AddWordsIntoView(),
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
      page: () => ProfileView(),
    ),
  ];
}
