import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/horizontal_list_viwe_builder.dart';

import 'package:jobsque_jobfinder/services/api_service.dart';

class JopUnite1ListViewFuturebuilder extends StatelessWidget {
  const JopUnite1ListViewFuturebuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: FutureBuilder(
          future: JobsApiService.fetchSugessttedJobs(),
          builder: (context, snapshot) {
            if (!snapshot.hasError) {
              if (snapshot.connectionState == ConnectionState.done) {
                return HorizontalListViweBuilder(jopesInfo: snapshot.data!);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            } else {
              return Center(
                  child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.black),
              ));
            }
          }),
    );
  }
}
