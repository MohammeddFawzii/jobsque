


import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/jop_info_unit2.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/models/suggested_jop_model.dart';
import 'package:jobsque_jobfinder/Features/Jop_Details/views/jop_details_view.dart';

class VirticalListViewBuilder extends StatelessWidget {
  const VirticalListViewBuilder({
    super.key,
    required this.jopesInfo,
  });

  final List<SuggestedJopModel> jopesInfo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: jopesInfo.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              var currentJop = jopesInfo[index];
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return JopDetailsView(jopModel: currentJop);
                },
              ));
            },
            child: JopInfoUnite2(
              jopModel: jopesInfo[index],
            ),
          ),
        );
      },
    );
  }
}
