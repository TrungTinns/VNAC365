import 'package:get/get.dart';
import 'package:vnac365/presentation/auth/binding/active_binding.dart';
import 'package:vnac365/presentation/auth/binding/auth_binding.dart';
import 'package:vnac365/presentation/auth/view/active_view.dart';
import 'package:vnac365/presentation/auth/view/auth_view.dart';
import 'package:vnac365/presentation/home/binding/home_binding.dart';
import 'package:vnac365/presentation/home/view/home_view.dart';

class AppRoutes {
  static const String auth = '/auth';
  static const String active = '/active';
  static const String home = '/home';

  static List<GetPage> routes = [
    GetPage(name: auth, page: () => const AuthScreen(), binding: AuthBinding()),
    GetPage(
        name: active,
        page: () => const ActiveScreen(),
        binding: ActiveBinding()),
    GetPage(name: home, page: () => const HomeScreen(), binding: HomeBinding()),
  ];
}
