import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Features/Onboarding/Widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static const id = "onboardingview";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingViewBody(),
    );
  }
}
