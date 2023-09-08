import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Views/search_view.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/custom_search_bar.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/jop_section_bar.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/jop_unit1_list_view_builder.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/jop_unit2_list_view_builder.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/welcoming_new_user.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          const SliverToBoxAdapter(
            child: WelcomNewUser(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 28,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomeSearchBar(
              hintText: "Search",
              searchBarenabeld: false,
              ontap: () {
                Navigator.pushNamed(context, SearchView.id);
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          const SliverToBoxAdapter(
            child: JopSectionBar(
              jopslistname: "Suggested Job",
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: JopUnite1ListViewbuilder(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          const SliverToBoxAdapter(
            child: JopSectionBar(
              jopslistname: "Recent Job",
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: JopUnite2ListViewbuilder(),
          )
        ],
      ),
    );
  }
}
