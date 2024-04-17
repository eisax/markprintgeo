
import 'package:get/get.dart';
import 'package:markprintgeo/view/screens/mainnavigation/navigation_bar_screen.dart';
import 'package:markprintgeo/view/screens/auth/widgets/signinscreen.dart';
import 'package:markprintgeo/view/screens/auth/widgets/signupscreen.dart';
import 'package:markprintgeo/view/screens/createsurvey/createsurvey/create_survey_screen.dart';
import 'package:markprintgeo/view/screens/createsurvey/dashboard_screen/create_survey_bottom_tabs.dart';
import 'package:markprintgeo/view/screens/survey/survey_list_screen.dart';
import 'package:markprintgeo/view/screens/more/more_screen.dart';
import 'package:markprintgeo/view/screens/splash/splashscreen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String auth = '/auth';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String surveyslist = '/surveyslist';
  static const String addsurveyquestion = '/addsurveyquestion';
  static const String createsurvey = '/createsurvey';
  static const String profile = '/profile';

  static const String createsurveydashboard = '/createsurveydashboard';

  static getInitialRoute() => initial;
  static getSplashRoute() => splash;
  static getAuthRoute(String name) => '$auth?name=$name';
  static getRegisterRoute(String name) => '$register?name=$name';
  static getDashboardRoute(String name) => '$dashboard?name=$name';
  static getsurveyslistRoute(String name) => '$surveyslist?name=$name';
  static getAddsurveyquestionRoute(String name) => '$addsurveyquestion?name=$name';
  static getCreatesurveyRoute(String name) => '$createsurvey?name=$name';
  static getProfileRoute(String name) => '$profile?name=$name';
  static getCreateSurveyDashboardRoute(String name) => '$createsurveydashboard?name=$name';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashScreen()),
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(
      name: surveyslist,
      page: () => const SurveyListScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: auth,
      page: () => const SignInScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: register,
      page: () => const SignUpScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: dashboard,
      page: () => MainNavigationBar(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: createsurvey,
      page: () => CreateSurveyScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: profile,
      page: () => ProfileScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    
    GetPage(
      name: createsurveydashboard,
      page: () => CreateSurveyDashboardScreen(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    
  ];
}
