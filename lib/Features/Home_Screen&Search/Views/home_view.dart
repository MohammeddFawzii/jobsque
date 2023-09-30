import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_colors.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_fonts_styles.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_images.dart';
import 'package:jobsque_jobfinder/Core/Utils/my_flutter_app_icons.dart';
import 'package:jobsque_jobfinder/Features/AplliedJop/views/applied_jop_view.dart';
import 'package:jobsque_jobfinder/Features/Messages/views/messages_view.dart';
import 'package:jobsque_jobfinder/Features/Profile/views/profile_view.dart';
import 'package:jobsque_jobfinder/Features/Saved_Jop/views/saved_view.dart';

import '../Widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const id = "HomeView";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  @override
  List<Widget> views = [
    const HomeViewBody(),
    MessagesView(),
    const AppliedJopView(),
    const SavedView(),
    const ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          selectedItemColor: AppColors.appPrimaryColors500,
          unselectedLabelStyle: AppFontsStyles.textstyle14,
          showUnselectedLabels: true,
          unselectedItemColor: AppColors.appNeutralColors400,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Iconsax.home),
                label: "Home",
                activeIcon: Icon(Iconsax.home_15)),
            const BottomNavigationBarItem(
                icon: Icon(Iconsax.message),
                label: "message",
                activeIcon: Icon(Iconsax.message5)),
            const BottomNavigationBarItem(
              icon: Icon(Iconsax.briefcase),
              label: "Applied",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Iconsax.archive_minus),
              label: "Saved",
              activeIcon: Icon(CustomFlutterIcons.archiveMinus),
            ),
            BottomNavigationBarItem(
                icon: const Icon(Iconsax.user_square),
                label: "Profile",
                activeIcon: SvgPicture.asset(AppImages.profileSelectedIocn))
          ]),
      body: SafeArea(child: views[currentIndex]),
    );
  }
}
