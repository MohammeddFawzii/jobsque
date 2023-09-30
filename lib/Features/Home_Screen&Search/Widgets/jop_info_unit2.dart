import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_colors.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_fonts_styles.dart';
import 'package:jobsque_jobfinder/Core/Utils/constans.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/jop_details.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/jop_features.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/models/suggested_jop_model.dart';

class JopInfoUnite2 extends StatefulWidget {
  const JopInfoUnite2({
    super.key,
    required this.jopModel,
  });
  final SuggestedJopModel jopModel;

  @override
  State<JopInfoUnite2> createState() => _JopInfoUnite2State();
}

class _JopInfoUnite2State extends State<JopInfoUnite2> {
  bool isarrchived = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 103,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(widget.jopModel.jopImage),
              const SizedBox(
                width: 16,
              ),
              JopDetails(
                  title: widget.jopModel.jopName,
                  subtitel: widget.jopModel.jopType),
              const Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    isarrchived = !isarrchived;
                  });
                },
                icon: Icon(Iconsax.archive_minus,
                    color: isarrchived == true
                        ? AppColors.appPrimaryColors500
                        : AppColors.appNeutralColors900),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: JopFeatures(
                  workType: widget.jopModel.jopTimeType,
                  workNature: widget.jopModel.jopLevel,
                  jopSkill: widget.jopModel.jopType,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: widget.jopModel.salary,
                      style: AppFontsStyles.textstyle16.copyWith(
                          //  fontSize: 10,
                          fontFamily: textFamilyMedium,
                          color: AppColors.appSuccessColors700),
                    ),
                    TextSpan(
                      text: "Month",
                      style: AppFontsStyles.textstyle12.copyWith(
                        fontFamily: textFamilyMedium,
                        color: AppColors.appNeutralColors500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
