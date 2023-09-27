// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';
import '../widgets/introduction_body_widget.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) {
                return BuildIntroScreen(
                    imageUrl: imageUrl[index],
                    title: title[index],
                    supTitle: subTitle[index],
                    isShow: index == 2);
              },
              itemCount: 3,
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.80),
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: WormEffect(
                  activeDotColor: AppColors.secondaryColor,
                  paintStyle: PaintingStyle.fill,
                  dotColor: AppColors.mainColor,
                  radius: 3,
                  spacing: 10,
                  dotHeight: 5,
                  type: WormType.thin,
                  dotWidth: 20),
            ),
          )
        ],
      )),
    );
  }

  List<String> imageUrl = [
    AppImages.onboarding1,
    AppImages.onboarding1,
    AppImages.onboarding1,
  ];
  List<String> title = [
    AppImages.onboarding1,
    AppImages.onboarding1,
    AppImages.onboarding1,
  ];
  List<String> subTitle = [
    AppImages.onboarding1,
    AppImages.onboarding1,
    AppImages.onboarding1,
  ];
}
