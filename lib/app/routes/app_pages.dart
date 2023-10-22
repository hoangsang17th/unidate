import 'package:get/get.dart';
import 'package:unidate/app/bindings/manager.binding.dart';
import 'package:unidate/app/modules/auth/views/login.view.dart';
import 'package:unidate/app/modules/auth/views/register.view.dart';
import 'package:unidate/app/modules/profile/views/profile.view.dart';
import 'package:unidate/app/modules/profile/views/setup_profile.view.dart';
import 'package:unidate/app/modules/auth/views/welcome.view.dart';
import 'package:unidate/app/modules/dashboard/views/dashboard.view.dart';

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
      name: AppRoutes.SETUP_PROFILE,
      page: () => const SetupProfileView(),
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
      page: () => const ProfileView(),
    ),
  ];
}
