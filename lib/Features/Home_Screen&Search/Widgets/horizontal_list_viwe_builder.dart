


import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/jop_info_unite1.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/models/suggested_jop_model.dart';
import 'package:jobsque_jobfinder/Features/Jop_Details/views/jop_details_view.dart';

class HorizontalListViweBuilder extends StatelessWidget {
  const HorizontalListViweBuilder({
    super.key,
    required this.jopesInfo,
  });

  final List<SuggestedJopModel> jopesInfo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jopesInfo.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {
              var currentJop = jopesInfo[index];
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return JopDetailsView(jopModel: currentJop);
                },
              ));
            },
            child: JopInfoUnite1(
              jopModel: jopesInfo[index],
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }
}
