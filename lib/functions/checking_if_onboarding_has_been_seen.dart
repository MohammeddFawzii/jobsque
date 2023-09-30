
import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> checkingIfOnboardingHasBeenSeen() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getBool("isViewd");
}
