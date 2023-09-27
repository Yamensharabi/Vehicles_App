import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicles_app/view/auth/screens/signin_screen.dart';
import 'package:vehicles_app/view/auth/screens/signup_screen.dart';
import 'package:vehicles_app/view/auth/screens/splash_screen.dart';
import 'package:vehicles_app/view/vehicles/screens/my_vehicles_screen.dart';

import 'core/constants/app_theme.dart';
import 'core/constants/router.dart';
import 'core/constants/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeArabic,
        locale: const Locale("ar"),
        getPages: AppRoutes.routes,
        initialRoute: Routes.splashScreen,
        //  home: SigninScreen(),
      ),
    );
  }
}
