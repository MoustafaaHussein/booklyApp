import 'package:bookly_app/core/utils/app_images.dart';
import 'package:bookly_app/features/home/data/presentation/views/home_view.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/sliding_animation_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController; // gives value from 0-1
  late Animation<Offset> slidingAnimation;
  @override
  void dispose() {
    animationController
        .dispose(); // to avoid memory leak and increase our performance
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    Future.delayed(Duration(seconds: 3), () {
      Get.to(HomeView(), transition: Transition.circularReveal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.imagesLogo),
        const SizedBox(height: 24),
        SlidingAnimationText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    slidingAnimation = Tween(
      begin: Offset(0, 5),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }
}
