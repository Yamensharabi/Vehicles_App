// ignore_for_file: avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicles_app/core/custom_widget/custom_text.dart';
import 'package:vehicles_app/view/auth/screens/signup_screen.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';
import '../../../core/constants/routes.dart';
import '../../../core/constants/svgs.dart';
import '../../../core/custom_widget/text_fields/custom_text_form_field.dart';
import '../../../core/functions/aler_exit_app.dart';
import '../../../logic/controllers/auth/signin_controller.dart';

class SigninScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => alertExitApp(context),
        child: Stack(children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              AppImages.login,
              fit: BoxFit.fill,
            ),
          ),
          Container(color: Colors.white.withOpacity(.9)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(AppImages.logo)),
                CustomText(
                    text: "تسجيل الدخول",
                    textStyle: context.textTheme.titleLarge!
                        .copyWith(fontSize: 26, fontWeight: FontWeight.w700)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextFormField(
                      validator: () {},
                      controller: loginController.phoneController,
                      hintText: "رقم الهاتف",
                      prefixIcon: SvgPicture.asset(AppSvgs.phone),
                      prefixPadding: 14,
                    ),
                    CustomTextFormField(
                      validator: () {},
                      controller: loginController.passwordController,
                      hintText: "كلمة السر",
                      prefixIcon: SvgPicture.asset(AppSvgs.lock),
                      prefixPadding: 14,
                    ),
                    CustomText(
                        text: "هل نسيت كلمة المرور؟",
                        textStyle: context.textTheme.titleMedium!
                            .copyWith(fontWeight: FontWeight.w700)),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onPressed: () {
                      //print("signup");
                      loginController.login();
                    },
                    child: Center(
                        child: CustomText(
                            text: "تسجيل الدخول",
                            textStyle: context.textTheme.titleLarge!.copyWith(
                                color: AppColors.grey,
                                fontWeight: FontWeight.w800))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: "ليس لديك حساب؟ ",
                        textStyle: context.textTheme.titleLarge),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.signUpScreen);
                      },
                      child: CustomText(
                          text: "إنشاء حساب",
                          textStyle: context.textTheme.titleLarge!.copyWith(
                              color: AppColors.secondaryColor,
                              decoration: TextDecoration.underline)),
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
