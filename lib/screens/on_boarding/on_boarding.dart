import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_assets.dart';
import 'package:islami/core/theme/app_colors.dart';
import 'package:islami/screens/layout/layout_screen.dart';
import 'package:islami/screens/on_boarding/models/on_boarding_model.dart';
import 'package:islami/screens/on_boarding/widgets/onboarding_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/dot_indicator.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({super.key});
  static const String routeName = 'on boarding';

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
        image: 'assets/on_boarding/1.png', title: 'Welcome To Islmi App'),
    OnBoardingModel(
        image: 'assets/on_boarding/2.png',
        title: 'Welcome To Islami',
        description: 'We Are Very Excited To Have You In Our Community'),
    OnBoardingModel(
        image: 'assets/on_boarding/3.png',
        title: 'Reading the Quran',
        description: 'Read, and your Lord is the Most Generous'),
    OnBoardingModel(
        image: 'assets/on_boarding/4.png',
        title: 'Bearish',
        description: 'Praise the name of your Lord, the Most\nHigh'),
    OnBoardingModel(
        image: 'assets/on_boarding/5.png',
        title: 'Holy Quran Radio',
        description:
        'You can listen to the Holy Quran Radio\nthrough the application for free and easily'),
  ];

  @override
  void initState() {
    pageController.addListener(() {
      currentIndex = pageController.page?.toInt() ?? 0;
      setState(() {});
    });
    super.initState();
  }

  PageController pageController = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            Center(child: Image.asset(AppAssets.homelogo)),
            Expanded(
              child: PageView.builder(
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return OnBoardingWidget(
                      onBoardingModel: onBoardingList[index],
                    );
                  },
                  itemCount: 5),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 8, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentIndex != 0
                      ? TextButton(
                      onPressed: () {
                        pageController.animateToPage(currentIndex - 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.decelerate);
                      },
                      child: Text(
                        'Back',
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: theme.primaryColor),
                      ))
                      : Text(' '),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DotIndicator(
                        isActive: currentIndex == 0,
                      ),
                      DotIndicator(
                        isActive: currentIndex == 1,
                      ),
                      DotIndicator(
                        isActive: currentIndex == 2,
                      ),
                      DotIndicator(
                        isActive: currentIndex == 3,
                      ),
                      DotIndicator(
                        isActive: currentIndex == 4,
                      )
                    ],
                  ),

                  TextButton(
                      onPressed: () {
                        currentIndex != 4 ? pageController.animateToPage(
                            currentIndex + 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.decelerate) : finishOnBoarding();
                      },
                      child: Text(
                        currentIndex != 4 ? 'Next' : 'Finish',
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: theme.primaryColor),
                      ))

                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  finishOnBoarding()async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setBool('first', false);
    Navigator.pushNamed(context, LayoutScreen.routeName);

  }
}