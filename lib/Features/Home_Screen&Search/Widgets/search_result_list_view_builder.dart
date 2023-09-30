


import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/jop_info_unit2.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/models/suggested_jop_model.dart';

class SearchResultListViewBuilder extends StatelessWidget {
  const SearchResultListViewBuilder({
    super.key,
    required this.jopesInfo,
  });
  final List<SuggestedJopModel> jopesInfo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jopesInfo.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: JopInfoUnite2(jopModel: jopesInfo[index]),
        );
      },
    );
  }
}
