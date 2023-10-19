import 'package:get/get.dart';
import 'package:unidate/app/modules/auth/views/login.view.dart';
import 'package:unidate/app/modules/auth/views/register.view.dart';
import 'package:unidate/app/modules/auth/views/welcome.view.dart';
import 'package:unidate/app/modules/dashboard/views/dashboard.view.dart';

import '../modules/dashboard/bindings/home.binding.dart';
import '../bindings/auth.binding.dart';
import '../modules/auth/views/waiting.view.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.AUTH;

  static final routes = [
    GetPage(
      name: AppRoutes.AUTH,
      page: () => const WaitingView(),
      bindings: [AuthBinding()],
    ),
    //
    GetPage(
      name: AppRoutes.WELCOME,
      page: () => const WelcomeView(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginView(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => const RegisterView(),
    ),
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => const DashBoardView(),
      bindings: [HomeBinding()],
    ),
  ];
}
