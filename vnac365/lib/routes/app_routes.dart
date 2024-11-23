import 'package:get/get.dart';
import 'package:vnac365/presentation/account/binding/account_binding.dart';
import 'package:vnac365/presentation/account/view/account_view.dart';
import 'package:vnac365/presentation/auth/binding/active_binding.dart';
import 'package:vnac365/presentation/auth/binding/auth_binding.dart';
import 'package:vnac365/presentation/auth/view/active_view.dart';
import 'package:vnac365/presentation/auth/view/auth_view.dart';
import 'package:vnac365/presentation/bottomnavbar/binding/bottomnavbar_binding.dart';
import 'package:vnac365/presentation/bottomnavbar/view/bottomnavbar_view.dart';
import 'package:vnac365/presentation/home/binding/home_binding.dart';
import 'package:vnac365/presentation/home/view/home_view.dart';
import 'package:vnac365/presentation/quiz/binding/quiz_binding.dart';
import 'package:vnac365/presentation/quiz/view/quiz_view.dart';

class AppRoutes {
  static const String auth = '/auth';
  static const String active = '/active';
  static const String bottomNavBar = '/bottom_nav_bar';
  static const String home = '/home';
  static const String account = '/account';
  static const String quiz = '/quiz';

  static List<GetPage> routes = [
    GetPage(name: auth, page: () => const AuthScreen(), binding: AuthBinding()),
    GetPage(
        name: active,
        page: () => const ActiveScreen(),
        binding: ActiveBinding()),
    GetPage(
        name: bottomNavBar,
        page: () => const BottomNavBarScreen(),
        binding: BottomNavBarBinding()),
    GetPage(name: home, page: () => const HomeScreen(), binding: HomeBinding()),
    GetPage(
        name: account,
        page: () => const AccountScreen(),
        binding: AccountBinding()),
    GetPage(name: quiz, page: () => QuizScreen(), binding: QuizBinding()),
  ];
}
