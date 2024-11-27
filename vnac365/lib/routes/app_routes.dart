import 'package:get/get.dart';
import 'package:vnac365/presentation/account/binding/account_binding.dart';
import 'package:vnac365/presentation/account/view/account_view.dart';
import 'package:vnac365/presentation/active/binding/active_code_binding.dart';
import 'package:vnac365/presentation/active/view/activre_code_view.dart';
import 'package:vnac365/presentation/auth/binding/active_binding.dart';
import 'package:vnac365/presentation/auth/binding/auth_binding.dart';
import 'package:vnac365/presentation/auth/view/active_view.dart';
import 'package:vnac365/presentation/auth/view/auth_view.dart';
import 'package:vnac365/presentation/bottomnavbar/binding/bottomnavbar_binding.dart';
import 'package:vnac365/presentation/bottomnavbar/view/bottomnavbar_view.dart';
import 'package:vnac365/presentation/history/binding/history_binding.dart';
import 'package:vnac365/presentation/history/view/history_view.dart';
import 'package:vnac365/presentation/home/binding/home_binding.dart';
import 'package:vnac365/presentation/home/view/home_view.dart';
import 'package:vnac365/presentation/quiz/binding/quiz_binding.dart';
import 'package:vnac365/presentation/quiz/view/quiz_view.dart';

class AppRoutes {
  static const String auth = '/auth';
  static const String active_otp = '/active_otp';
  static const String bottomNavBar = '/bottom_nav_bar';
  static const String home = '/home';
  static const String account = '/account';
  static const String quiz = '/quiz';
  static const String history = '/history';
  static const String active_code = '/active_code';

  static List<GetPage> routes = [
    GetPage(name: auth, page: () => const AuthScreen(), binding: AuthBinding()),
    GetPage(
        name: active_otp,
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
    GetPage(
        name: history,
        page: () => const HistoryScreen(),
        binding: HistoryBinding()),
    GetPage(
        name: active_code,
        page: () => const ActiveCodeScreen(),
        binding: ActiveCodeBinding()),
  ];
}
