import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/models/suggested_jop_model.dart';
import 'package:jobsque_jobfinder/Features/Jop_Details/widgets/jop_details_view_body.dart';

class JopDetailsView extends StatelessWidget {
  const JopDetailsView({super.key, required this.jopModel});
  final SuggestedJopModel jopModel;
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(child: JopDetailsViewBody(jopModel: jopModel,)),
      ),
    );
  }
}
