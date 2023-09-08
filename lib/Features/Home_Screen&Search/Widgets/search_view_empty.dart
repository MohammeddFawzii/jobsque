import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/popular_search_list_view_builder.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/recent_search_list_view_builder.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/search_seaction_bar.dart';


class SearchViewEmpty extends StatelessWidget {
  const SearchViewEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 22,
        ),
        const SearchSectionBar(
          text: "Recent searches",
        ),
        const SizedBox(
          height: 20,
        ),
        RecentSearchListVeiwBuilder(),
        const SearchSectionBar(
          text: "Popular searches",
        ),
        const SizedBox(
          height: 20,
        ),
        PopularSearchListViewBuilder(),
      ],
    );
  }
}
