import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vehicles_app/core/custom_widget/custom_text.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';
import '../../../core/constants/routes.dart';
import '../../../core/constants/svgs.dart';
import '../../../core/custom_widget/custom_appbar.dart';
import '../../../core/custom_widget/text_fields/custom_text_form_field.dart';
import '../../../core/functions/aler_exit_app.dart';
import '../../../logic/controllers/auth/register_controller.dart';

class SignupScreen extends StatelessWidget {
  final RegisterController registerController = Get.put(RegisterController());

  SignupScreen({super.key});

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: AppColors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: SvgPicture.asset(AppSvgs.chevron_right),
                        ),
                      ),
                    ),
                    Center(child: Image.asset(AppImages.logo)),
                    const SizedBox()
                  ],
                ),
                CustomText(
                    text: "إنشاء حساب",
                    textStyle: context.textTheme.titleLarge!
                        .copyWith(fontSize: 26, fontWeight: FontWeight.w700)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextFormField(
                      controller: registerController.nameController,
                      validator: () {},
                      hintText: "الاسم",
                      prefixIcon: SvgPicture.asset(AppSvgs.person),
                      prefixPadding: 14,
                    ),
                    CustomTextFormField(
                      controller: registerController.phoneController,
                      validator: () {},
                      hintText: "رقم الهاتف",
                      prefixIcon: SvgPicture.asset(AppSvgs.phone),
                      prefixPadding: 14,
                    ),
                    CustomTextFormField(
                      controller: registerController.passwordController,
                      validator: () {},
                      hintText: "كلمة السر",
                      prefixIcon: SvgPicture.asset(AppSvgs.lock),
                      prefixPadding: 14,
                    ),
                    CustomTextFormField(
                      controller: registerController.confirmPasswordController,
                      validator: () {},
                      hintText: "تأكيد كلمة المرور",
                      prefixIcon: SvgPicture.asset(AppSvgs.lock),
                      prefixPadding: 14,
                    ),
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
                      print("signup");
                      // registerController.registerWithEmail();
                    },
                    child: Center(
                        child: CustomText(
                            text: "إنشاء الحساب",
                            textStyle: context.textTheme.titleLarge!.copyWith(
                                color: AppColors.grey,
                                fontWeight: FontWeight.w800))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: "لديك حساب؟",
                        textStyle: context.textTheme.titleLarge),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.signInScreen);
                      },
                      child: CustomText(
                          text: "تسجيل الدخول ",
                          textStyle: context.textTheme.titleLarge!.copyWith(
                              color: AppColors.secondaryColor,
                              decoration: TextDecoration.underline)),
                    ),
                  ],
                ),
                Center(
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: "متابعتك تعني موافقتك على ",
                      style: context.textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: "الشروط والأحكام\nوسياسة الخصوصية",
                          style: context.textTheme.titleMedium!.copyWith(
                              color: AppColors.secondaryColor,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
