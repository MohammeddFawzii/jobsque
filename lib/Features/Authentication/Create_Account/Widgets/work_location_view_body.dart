
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_colors.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_fonts_styles.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_images.dart';
import 'package:jobsque_jobfinder/Core/Utils/constans.dart';
import 'package:jobsque_jobfinder/Features/Authentication/Cubits/Register/register_cubit.dart';
import 'package:jobsque_jobfinder/Features/Authentication/Models/user_data_model.dart';
import 'package:jobsque_jobfinder/Features/Authentication/Widgets/page_initail_info.dart';
import 'package:jobsque_jobfinder/Features/Onboarding/Views/Widgets/custom_button.dart';
import 'job_location_container.dart';
import 'work_location_toggle_button.dart';

class WorkLocatinViewBody extends StatefulWidget {
  WorkLocatinViewBody({
    super.key,
    this.userName,
    this.email,
    this.jopTitle,
    this.registerMethode,
    this.password,
  });
  String? userName;
  String? email;
    List<String>? jopTitle;

  String? registerMethode;
  String? password;
  @override
  State<WorkLocatinViewBody> createState() => _WorkLocatinViewBodyState();
}

class _WorkLocatinViewBodyState extends State<WorkLocatinViewBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.95,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              PageInitialinfo(
                spacebetween: 12,
                pagegole: "Where are you prefefred Location?",
                pagegoledefination:
                    "Let us know, where is the work location you want at this time, so we can adjust it.",
                pagegoleStyle: AppFontsStyles.textstyle24.copyWith(
                  fontFamily: textFamilyMedium,
                  height: 1.4,
                  color: AppColors.appNeutralColors900,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const WorkLocationToggleButton(),
              const SizedBox(
                height: 27,
              ),
              Text(
                "Select the country you want for your job",
                style: AppFontsStyles.textstyle16
                    .copyWith(color: const Color(0xff737379)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Wrap(
                children: [
                  JopLocatinContainer(
                      stateFlag: AppImages.unitedstases,
                      countryName: "United States"),
                  JopLocatinContainer(
                      stateFlag: AppImages.malaysia, countryName: "Malaysia"),
                  JopLocatinContainer(
                      stateFlag: AppImages.singafora, countryName: "Singapore"),
                  JopLocatinContainer(
                      stateFlag: AppImages.indonesia, countryName: "Indonesia"),
                  JopLocatinContainer(
                      stateFlag: AppImages.philiphines,
                      countryName: "Philipines"),
                  JopLocatinContainer(
                      stateFlag: AppImages.polanda, countryName: "Polandia"),
                  JopLocatinContainer(
                      stateFlag: AppImages.india, countryName: "india"),
                  JopLocatinContainer(
                      stateFlag: AppImages.vietnam, countryName: "Vietnam"),
                  JopLocatinContainer(
                      stateFlag: AppImages.china, countryName: "china"),
                  JopLocatinContainer(
                      stateFlag: AppImages.canda, countryName: "canda"),
                  JopLocatinContainer(
                      stateFlag: AppImages.saudiarabia,
                      countryName: "Suadi Arabia"),
                  JopLocatinContainer(
                      stateFlag: AppImages.argantina, countryName: "Argantina"),
                  JopLocatinContainer(
                      stateFlag: AppImages.brazil, countryName: "Brazil"),
                ],
              ),
              const Spacer(),
              Center(
                child: CustomButton(
                    onPressed: () async{
                      if (widget.registerMethode == emailAndPasswordmethode &&
                          JopLocatinContainer.workloction.isNotEmpty) {
                        BlocProvider.of<RegisterCubit>(context)
                            .registerWithEmailAndPassword(
                          userModel: UserModel(
                              userName: widget.userName!,
                              userPhoto:
                                  "lib/Core/Utils/assets/images/profile-pic.png",
                              email: widget.email!,
                              wantedJop: widget.jopTitle!,
                              workLocation: JopLocatinContainer.workloction,
                              workNature: WorkLocationToggleButton.worknature),
                          password: widget.password!,
                        );
                      } else if (widget.registerMethode == googleMethode) {
                        BlocProvider.of<RegisterCubit>(context)
                            .signUpWithGoogle(
                          userModel: UserModel(
                              wantedJop: widget.jopTitle!,
                              workLocation: JopLocatinContainer.workloction,
                              workNature: WorkLocationToggleButton.worknature),
                        );
                      } else if (widget.registerMethode == facebookMethode) {
                         BlocProvider.of<RegisterCubit>(context)
                            .signUpWithFacebook(
                          userModel: UserModel(
                              wantedJop: widget.jopTitle!,
                              workLocation: JopLocatinContainer.workloction,
                              workNature: WorkLocationToggleButton.worknature),
                        );
                      }
                    },
                    buttonName: "Next"),
              ),
              const SizedBox(
                height: 9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
