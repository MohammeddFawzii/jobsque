import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/search_result_list_view_builder.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/search_seaction_bar.dart';

import 'filter_option_list_view.dart';

class SuccessSearchView extends StatelessWidget {
  const SuccessSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 22,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: FilterOptionListView(),
        ),
        const SizedBox(
          height: 20,
        ),
        const SearchSectionBar(text: "Featuring 120+ jobs"),
        const SizedBox(
          height: 25,
        ),
        SearchResultListViewBuilder()
      ],
    );
  }
}
