import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_colors.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_fonts_styles.dart';

class JobNameBox extends StatefulWidget {
  const JobNameBox({
    super.key,
    required this.jobIcon,
    required this.jobtitle,
  });
  final IconData jobIcon;
  final String jobtitle;
  static List<String> joptitlepase = [];
  @override
  State<JobNameBox> createState() => _JobNameBoxState();
}

class _JobNameBoxState extends State<JobNameBox> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
          if (isSelected == true) {
            JobNameBox.joptitlepase.add(widget.jobtitle);
          }
        });
      },
      child: Container(
        width: 156,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color:
                    isSelected ? AppColors.appPrimaryColors500 : Colors.white),
            borderRadius: BorderRadius.circular(12),
            color: isSelected
                ? AppColors.appPrimaryColors100
                : AppColors.appNeutralColors300),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Icon(
                  widget.jobIcon,
                  size: 24,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.jobtitle,
                style: AppFontsStyles.textstyle14,
              )
            ],
          ),
        ),
      ),
    );
  }
}
