import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_colors.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_fonts_styles.dart';
import 'package:jobsque_jobfinder/Core/Utils/constans.dart';
import 'package:jobsque_jobfinder/Core/functions/get_user_info.dart';

class WelcomNewUser extends StatelessWidget {
  const WelcomNewUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: getUserName(),
              builder: (context, snapshot) {
                String name = snapshot.data ?? "unkown";
                return Text(
                  "Hi , $name",
                  style: AppFontsStyles.textstyle24.copyWith(
                      fontFamily: textFamilyMedium,
                      color: AppColors.appNeutralColors900),
                );
              },
            ),
            Text("👋",
                style: AppFontsStyles.textstyle24
                    .copyWith(fontFamily: textFamilyMedium)),
            Text(
              "Create a better future for yourself here",
              style: AppFontsStyles.textstyle14.copyWith(
                  fontFamily: textFamilyMedium,
                  color: AppColors.appNeutralColors500),
            ),
          ],
        ),
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: AppColors.appNeutralColors300),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(
            Iconsax.notification,
            color: Color(0xff292D32),
          ),
        )
      ],
    );
  }
}
