import 'package:flutter/material.dart';

import '../Widgets/job_name_view_body.dart';

class JobnameView extends StatelessWidget {
  JobnameView({
    super.key,
    this.userName,
    this.email,
    this.registerMethode,
    this.password,
  });
  static const id = "jobtitleview";
  String? userName;
  String? email;
  String? registerMethode;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: JobNameViewBody(
        userName: userName,
        email: email,
        password: password,
        registerMethode: registerMethode,
      )),
    );
  }
}
