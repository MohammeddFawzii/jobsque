import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_colors.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/jop_nature_options.dart';

class JopFeatures extends StatelessWidget {
  const JopFeatures({
    super.key,
    required this.workType,
    required this.workNature,
    this.jopSkill,
    this.color,
    this.textColor, this.rightdestenation,
  });

  final String workType;
  final String workNature;
  final String? jopSkill;
  final Color? color;
  final Color? textColor;
  final double? rightdestenation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        JopNatureOptions(
          jopnature: workType,
          color: color ?? AppColors.appPrimaryColors100,
          textColor: textColor ?? AppColors.appPrimaryColors500,
          height: 26,
          width: 72,
        ),
        JopNatureOptions(
          jopnature: workNature,
          color: color ?? AppColors.appPrimaryColors100,
          textColor: textColor ?? AppColors.appPrimaryColors500,
          height: 26,
          width: 72,
        ),
        jopSkill != null
            ? JopNatureOptions(
                jopnature: jopSkill!,
                color: color ?? AppColors.appPrimaryColors100,
                textColor: textColor ?? AppColors.appPrimaryColors500,
                height: 26,
                width: 72,
              )
            : Container(),
         SizedBox(
          width: rightdestenation??0,
        ),
      ],
    );
  }
}
