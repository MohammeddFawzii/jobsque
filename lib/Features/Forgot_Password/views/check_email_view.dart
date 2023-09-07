import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Features/Forgot_Password/Widgets/check_emial_view_body.dart';

class CheckEmailView extends StatelessWidget {
  const CheckEmailView({super.key});
  static const id = "checkemial";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: CheckEmialViewBody()),
    );
  }
}
