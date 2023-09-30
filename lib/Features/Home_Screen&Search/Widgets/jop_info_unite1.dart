import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_colors.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_fonts_styles.dart';
import 'package:jobsque_jobfinder/Core/Utils/constans.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/jop_details.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/jop_features.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/models/suggested_jop_model.dart';

class JopInfoUnite1 extends StatefulWidget {
  const JopInfoUnite1({
    super.key,
    required this.jopModel,
    this.onPressed,
  });
  final SuggestedJopModel jopModel;
  final void Function()? onPressed;

  @override
  State<JopInfoUnite1> createState() => _JopInfoUnite1State();
}

class _JopInfoUnite1State extends State<JopInfoUnite1> {
  bool isArchived = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 190,
      decoration: BoxDecoration(
        color: AppColors.appPrimaryColors900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
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
                  subtitel: widget.jopModel.jopType,
                  
                  titleColor: Colors.white,
                  subtitleColor: AppColors.appNeutralColors400,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isArchived = !isArchived;
                      });
                    },
                    icon: Icon(
                      Iconsax.archive_minus,
                      color: isArchived == true
                          ? AppColors.appPrimaryColors500
                          : (Colors.white),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            JopFeatures(
              workType: widget.jopModel.jopType,
              workNature: widget.jopModel.jopTimeType,
              jopSkill: widget.jopModel.jopSkills,
              color: AppColors.appNeutralColors300.withOpacity(0.3),
              textColor: Colors.white,
              rightdestenation: 24,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: widget.jopModel.salary,
                        style: AppFontsStyles.textstyle18.copyWith(
                          fontFamily: textFamilyMedium,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: widget.jopModel.salary,
                        style: AppFontsStyles.textstyle12.copyWith(
                          fontFamily: textFamilyMedium,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 36,
                  width: 104,
                  child: ElevatedButton(
                      onPressed: widget.onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appPrimaryColors500,
                      ),
                      child: Text(
                        "Apply now",
                        style: AppFontsStyles.textstyle12.copyWith(
                            fontFamily: textFamilyMedium, color: Colors.white),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
