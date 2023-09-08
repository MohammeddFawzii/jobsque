import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_images.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/jop_info_unit2.dart';

import '../models/suggested_jop_model.dart';


class SearchResultListViewBuilder extends StatelessWidget {
  SearchResultListViewBuilder({super.key});
  List<SuggestedJopModel> jopesInfo = [
    SuggestedJopModel(
      comunicationToolIcon: AppImages.twitterIcon,
      jopTitle: "Product Designer",
      comunicationtoolname: "Zoom • United States",
      workType: "Fulltime",
      workNature: "Remote",
      jopSkill: "Design",
      salary: r"$15K",
      salaryTime: "/Month",
    ),
    SuggestedJopModel(
      jopTitle: "Product Designer",
      comunicationtoolname: "Zoom • United States",
      workType: "Fulltime",
      workNature: "Remote",
      jopSkill: "Design",
      salary: r"$15K",
      salaryTime: "/Month",
      comunicationToolIcon: AppImages.discordIcon,
    ),
    SuggestedJopModel(
      jopTitle: "Product Designer",
      comunicationtoolname: "Zoom • United States",
      workType: "Fulltime",
      workNature: "Remote",
      jopSkill: "Design",
      salary: r"$15K",
      salaryTime: "/Month",
      comunicationToolIcon: AppImages.spectrumIcon,
    ),
    SuggestedJopModel(
      jopTitle: "Product Designer",
      comunicationtoolname: "Zoom • United States",
      workType: "Fulltime",
      workNature: "Remote",
      jopSkill: "Design",
      salary: r"$15K",
      salaryTime: "/Month",
      comunicationToolIcon: AppImages.vKLogo,
    ),
    SuggestedJopModel(
      jopTitle: "Product Designer",
      comunicationtoolname: "Zoom • United States",
      workType: "Fulltime",
      workNature: "Remote",
      jopSkill: "Design",
      salary: r"$15K",
      salaryTime: "/Month",
      comunicationToolIcon: AppImages.invisionIcon,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.builder(
          itemCount: jopesInfo.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: JopInfoUnite2(jopModel: jopesInfo[index]),
            );
          },
        ),
      ),
    );
  }
}
