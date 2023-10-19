import 'package:get/get.dart';
import 'package:unidate/app/modules/auth/views/login.view.dart';

import '../modules/dashboard/bindings/home.binding.dart';
import '../bindings/auth.binding.dart';
import '../modules/dashboard/views/home.view.dart';
import '../modules/auth/views/splash.view.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.AUTH;

  static final routes = [
    GetPage(
      name: AppRoutes.AUTH,
      page: () => const WelcomeView(),
      bindings: [AuthBinding()],
    ),
     GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginView(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeView(),
      bindings: [HomeBinding()],
    ),
  ];
}
