import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bmi_calculator/core/constants/app_color.dart';
import 'package:bmi_calculator/features/bmi_calculator/presentation/pages/bmi_calculator.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000,
      splash: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
            ),
          ],
        ),
        child: Image.asset('assets/logo/rounded_logo.png'),
      ),
      nextScreen: const BmiCalculator(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: AppColor.primaryColor,
          // : Colors.lime.shade100,
    );
  }
}
