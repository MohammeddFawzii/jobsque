import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobsque_jobfinder/Features/Authentication/Create_Account/Views/register_view.dart';
import 'package:jobsque_jobfinder/Features/Authentication/Sign_IN/Views/sign_in_view.dart';
import 'package:jobsque_jobfinder/Features/Authentication/Create_Account/Views/sucess_account_image.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Views/search_view.dart';
import 'package:jobsque_jobfinder/Features/Jop_Details/views/apply_jop_view.dart';
import 'package:jobsque_jobfinder/Features/Onboarding/Views/onboarding_view.dart';
import 'package:jobsque_jobfinder/Features/Onboarding/Views/splash_view.dart';
import 'package:jobsque_jobfinder/Features/Forgot_Password/views/check_email_view.dart';
import 'package:jobsque_jobfinder/Features/Forgot_Password/views/forgot_password_view.dart';
import 'package:jobsque_jobfinder/Features/Forgot_Password/views/password_reset_successfully_view.dart';
import 'package:jobsque_jobfinder/Features/Forgot_Password/views/reset_password_view.dart';
import 'package:jobsque_jobfinder/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Features/Home_Screen&Search/Views/home_view.dart';

// Import all packages

bool? isViewed;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.white, systemNavigationBarColor: Colors.white
        // Set your desired status bar color here
        ),
  );
  await checkingIfOnboardingHasBeenSeen();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const JopFinderApp());
}

class JopFinderApp extends StatelessWidget {
  const JopFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        SplashView.id: (context) => const SplashView(),
        OnboardingView.id: (context) => const OnboardingView(),
        SignInView.id: (context) => const SignInView(),
        RegisterView.id: (context) => const RegisterView(),
        SuccessAcountImageView.id: (context) => const SuccessAcountImageView(),
        ForgotPasswordView.id: (context) => const ForgotPasswordView(),
        CheckEmailView.id: (context) => const CheckEmailView(),
        ResetPasswordView.id: (context) => const ResetPasswordView(),
        PasswordResetSuccessfullyView.id: (context) =>
            const PasswordResetSuccessfullyView(),
        HomeView.id: (context) => const HomeView(),
        ApplyJopView.id: (context) => const ApplyJopView(),
        SearchView.id: (context) => const SearchView(),
      },
      initialRoute: SplashView.id,
    );
  }
}

Future<void> checkingIfOnboardingHasBeenSeen() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getBool("isViewd");
}
