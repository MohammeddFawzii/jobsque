import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobsque_jobfinder/Features/AplliedJop/views/applied_jop_view.dart';
import 'package:jobsque_jobfinder/Features/Authentication/Create_Account/Views/register_view.dart';
import 'package:jobsque_jobfinder/Features/Authentication/Sign_IN/Views/sign_in_view.dart';
import 'package:jobsque_jobfinder/Features/Authentication/Create_Account/Views/sucess_account_image.dart';
import 'package:jobsque_jobfinder/Features/Chat/views/chat_view.dart';
import 'package:jobsque_jobfinder/Features/Complete_Profile.dart/views/complete_profile_view.dart';
import 'package:jobsque_jobfinder/Features/Complete_Profile.dart/views/education_view.dart';
import 'package:jobsque_jobfinder/Features/Complete_Profile.dart/views/experience_view.dart';
import 'package:jobsque_jobfinder/Features/Complete_Profile.dart/views/personal_details_view.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Views/search_view.dart';
import 'package:jobsque_jobfinder/Features/Jop_Details/views/apply_jop_view.dart';
import 'package:jobsque_jobfinder/Features/Jop_Details/views/jop_applied_succesfuly.dart';
import 'package:jobsque_jobfinder/Features/LoginAndSecurity/views/change_password_view.dart';
import 'package:jobsque_jobfinder/Features/LoginAndSecurity/views/email_adress_view.dart';
import 'package:jobsque_jobfinder/Features/LoginAndSecurity/views/phone_number_view.dart';
import 'package:jobsque_jobfinder/Features/LoginAndSecurity/views/two_step_verification_methode_view.dart';
import 'package:jobsque_jobfinder/Features/LoginAndSecurity/views/two_step_verification_send_code_view.dart';
import 'package:jobsque_jobfinder/Features/LoginAndSecurity/views/two_step_verification_view.dart';
import 'package:jobsque_jobfinder/Features/LoginAndSecurity/views/verify_code_view.dart';
import 'package:jobsque_jobfinder/Features/Notefication/views/notefication_view.dart';
import 'package:jobsque_jobfinder/Features/Onboarding/Views/onboarding_view.dart';
import 'package:jobsque_jobfinder/Features/Onboarding/Views/splash_view.dart';
import 'package:jobsque_jobfinder/Features/Forgot_Password/views/check_email_view.dart';
import 'package:jobsque_jobfinder/Features/Forgot_Password/views/forgot_password_view.dart';
import 'package:jobsque_jobfinder/Features/Forgot_Password/views/password_reset_successfully_view.dart';
import 'package:jobsque_jobfinder/Features/Forgot_Password/views/reset_password_view.dart';
import 'package:jobsque_jobfinder/Features/Profile/views/edit_profile_view.dart';
import 'package:jobsque_jobfinder/Features/Profile/views/help_center_view.dart';
import 'package:jobsque_jobfinder/Features/Profile/views/languages_view.dart';
import 'package:jobsque_jobfinder/Features/Profile/views/login_and_security_view.dart';
import 'package:jobsque_jobfinder/Features/Profile/views/notefication_seting_view.dart';
import 'package:jobsque_jobfinder/Features/Profile/views/portfolio_view.dart';
import 'package:jobsque_jobfinder/Features/Profile/views/privacy_policy_view.dart';
import 'package:jobsque_jobfinder/Features/Profile/views/terms%20_conditions_view.dart';
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
         ApplyJopView.id: (context) => const ApplyJopView(),
        JopAppliedSuccesfuly.id: (context) => const JopAppliedSuccesfuly(),
        NoteficationView.id: (context) => NoteficationView(),
        ChatView.id: (context) => const ChatView(),
        EditProfileView.id: (context) => const EditProfileView(),
        PortFolioView.id: (context) => const PortFolioView(),
        LanguagesView.id: (context) => const LanguagesView(),
        NoteficationSetingView.id: (context) => const NoteficationSetingView(),
        LoginAndSecurityView.id: (context) => const LoginAndSecurityView(),
        EmailAdressView.id: (context) => const EmailAdressView(),
        PhoneNumberView.id: (context) => const PhoneNumberView(),
        ChangePasswordView.id: (context) => const ChangePasswordView(),
        TwoStepVerificationView.id: (context) =>
            const TwoStepVerificationView(),
        TwoStepVerificationMethodeView.id: (context) =>
            const TwoStepVerificationMethodeView(),
        TwoStepVerificationSendCodeView.id: (context) =>
            const TwoStepVerificationSendCodeView(),
        VerifyCodeView.id: (context) => const VerifyCodeView(),
        HelpCenterView.id: (context) => const HelpCenterView(),
        TermsConditionsView.id: (context) => const TermsConditionsView(),
        PrivacyPolicyView.id: (context) => const PrivacyPolicyView(),
        AppliedJopView.id: (context) => const AppliedJopView(),
        CompleteProfileView.id: (context) => const CompleteProfileView(),
        PersonalDetailsView.id: (context) => const PersonalDetailsView(),
        EducationView.id: (context) => const EducationView(),
        ExperienceView.id: (context) => const ExperienceView(),
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
