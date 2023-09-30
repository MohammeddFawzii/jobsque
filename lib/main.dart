import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_routes.dart';
import 'package:jobsque_jobfinder/Core/Utils/simple_bloc_observer.dart';
import 'package:jobsque_jobfinder/Features/Onboarding/Views/splash_view.dart';
import 'package:jobsque_jobfinder/firebase_options.dart';
import 'package:jobsque_jobfinder/functions/checking_if_onboarding_has_been_seen.dart';
// Import all packages

bool? isViewed;
void main() async {
  Bloc.observer = SimpleBlocObserver();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, systemNavigationBarColor: Colors.white));

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
      routes: appRoutes,
      initialRoute: SplashView.id,
    );
  }
}
