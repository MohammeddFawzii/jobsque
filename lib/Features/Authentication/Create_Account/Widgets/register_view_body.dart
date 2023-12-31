import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_colors.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_fonts_styles.dart';
import 'package:jobsque_jobfinder/Core/Utils/constans.dart';
import 'package:jobsque_jobfinder/Features/Authentication/Create_Account/Views/job_name_view.dart';
import 'package:jobsque_jobfinder/Features/Authentication/Widgets/custom_authentication_options.dart';
import 'package:jobsque_jobfinder/Features/Authentication/Widgets/page_initail_info.dart';
import 'package:jobsque_jobfinder/Features/Authentication/Widgets/user_auth_options.dart';
import 'package:jobsque_jobfinder/Features/Authentication/Widgets/user_instractions.dart';
import 'package:jobsque_jobfinder/Features/Authentication/functions/show_snack_bar.dart';
import 'package:jobsque_jobfinder/Features/Onboarding/Widgets/custom_button.dart';
import '../../Widgets/custom_text_field.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  late String userName;
  late String password;
  late String email;
  late String userNameData = '';
  late String passwordData = '';
  late String emialData = '';
  bool changeHelperStyleColor = false;
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 39,
              ),
              const PageInitialinfo(
                pagegole: "Cereate Account",
                pagegoledefination:
                    "Please create an account to find your dream job",
              ),
              const SizedBox(
                height: 44,
              ),
              CustomTextField(
                hintText: 'Username',
                autovalidateMode: autovalidateMode,
                prefixicon: const Icon(
                  Iconsax.user_square,
                ),
                obscureText: false,
                onChanged: (value) {
                  setState(() {
                    userNameData = value!;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    userName = value!;
                  });
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Field is Required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                hintText: 'Email',
                autovalidateMode: autovalidateMode,
                prefixicon: const Icon(
                  Iconsax.sms,
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Field is Required";
                  }
                  return null;
                },
                obscureText: false,
                onChanged: (value) {
                  setState(() {
                    emialData = value!;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    email = value!;
                  });
                },
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                hintText: "Password",
                prefixicon: const Icon(Iconsax.lock),
                suffixicon: const Icon(Iconsax.eye_slash),
                helperText: "Password must be at least 8 characters",
                helperStyle: AppFontsStyles.textstyle16.copyWith(
                    color: changeHelperStyleColor
                        ? AppColors.appSuccessColors500
                        : AppColors.appNeutralColors400),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {
                  setState(() {
                    passwordData = value!;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    password = value!;
                  });
                },
                validator: (value) {
                  changeHelperStyleColor = true;
                  if (value!.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),
              Container(
                constraints: const BoxConstraints(minHeight: 105),
              ),
              UserInstractions(
                userDestenation: "Login",
                onTap: () {
                  Navigator.pop(context);
                },
                userQution: "Already have an account?",
              ),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JobnameView(
                            userName: userName,
                            email: email,
                            registerMethode: emailAndPasswordmethode,
                            password: password,
                          ),
                        ));
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                buttonName: "Create account",
                buttonColor: (passwordData.isNotEmpty &&
                        emialData.isNotEmpty &&
                        userNameData.isNotEmpty)
                    ? AppColors.appPrimaryColors500
                    : AppColors.appNeutralColors300,
                textButtonColor: (passwordData.isNotEmpty &&
                        emialData.isNotEmpty &&
                        userNameData.isNotEmpty)
                    ? Colors.white
                    : AppColors.appNeutralColors400,
              ),
              const SizedBox(
                height: 20,
              ),
              const UserAuthOptions(
                operationOption: "Or Sign up With Account",
              ),
              const SizedBox(
                height: 24,
              ),
              CustomAuthinticationOptions(site1OnTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JobnameView(
                      registerMethode: googleMethode,
                    ),
                  ),
                );
              }, site2OnTap: () {
                if (emialData.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JobnameView(
                        registerMethode: facebookMethode,
                        email: emialData,
                      ),
                    ),
                  );
                } else {
                  showSnackBar("email is required", context);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
