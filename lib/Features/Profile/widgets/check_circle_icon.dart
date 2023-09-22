import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_colors.dart';

class CheckCircleIcon extends StatelessWidget {
  const CheckCircleIcon({super.key, required this.isSelected, this.onTap});
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: isSelected == true
                    ? AppColors.appPrimaryColors500
                    : AppColors.appNeutralColors400),
            shape: BoxShape.circle),
        child: isSelected == true
            ? Center(
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: const BoxDecoration(
                      color: AppColors.appPrimaryColors500,
                      shape: BoxShape.circle),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
