import 'package:get/get.dart';
import 'package:vehicles_app/core/constants/routes.dart';

import '../../view/auth/screens/onboarding_screen.dart';
import '../../view/auth/screens/signin_screen.dart';
import '../../view/auth/screens/signup_screen.dart';
import '../../view/auth/screens/splash_screen.dart';
import '../../view/vehicles/screens/my_vehicles_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: Routes.signInScreen,
        page: () => SigninScreen(),
        transition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 300)),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignupScreen(),
    ),
    GetPage(
      name: Routes.onboardingScreen,
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: Routes.myVehiclesScreen,
      page: () => const MyVehiclesScreen(),
    ),
  ];
}
