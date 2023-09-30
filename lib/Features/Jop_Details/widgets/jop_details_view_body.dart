import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_colors.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_fonts_styles.dart';
import 'package:jobsque_jobfinder/Core/Utils/constans.dart';
import 'package:jobsque_jobfinder/Core/Wedgits/custom_tap_par.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/jop_details.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/jop_features.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/models/suggested_jop_model.dart';
import 'package:jobsque_jobfinder/Features/Jop_Details/views/apply_jop_view.dart';
import 'package:jobsque_jobfinder/Features/Jop_Details/widgets/jop_company_view.dart';
import 'package:jobsque_jobfinder/Features/Jop_Details/widgets/jop_discription_view.dart';
import 'package:jobsque_jobfinder/Features/Jop_Details/widgets/jop_people_view.dart';
import 'package:jobsque_jobfinder/Features/Onboarding/Widgets/custom_button.dart';

class JopDetailsViewBody extends StatelessWidget {
  const JopDetailsViewBody({super.key, required this.jopModel});
  final SuggestedJopModel jopModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 32),
          Image.asset(width: 42, height: 42, jopModel.jopImage),
          const SizedBox(height: 12),
          JopDetails(
            title: jopModel.jopName,
            subtitel: jopModel.jopDescription,
            crossAxisAlignment: CrossAxisAlignment.center,
            titleStyle: AppFontsStyles.textstyle20.copyWith(
                fontFamily: textFamilyMedium,
                color: AppColors.appNeutralColors900),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: JopFeatures(
              workType: jopModel.jopType,
              workNature: jopModel.jopTimeType,
              jopSkill: jopModel.jopSkills,
            ),
          ),
          const SizedBox(height: 32),
          const CustomTapPar(
            tabs: [
              Text("Desicription"),
              Text("Company"),
              Text("People"),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const Expanded(
            child: TabBarView(
              children: [
                JopDescriptionView(),
                JopCompanyView(),
                JopPeopleView(),
              ],
            ),
          ),
          CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, ApplyJopView.id);
              },
              buttonName: "Apply now"),
          const SizedBox(
            height: 9,
          )
        ],
      ),
    );
  }
}
