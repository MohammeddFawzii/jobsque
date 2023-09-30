import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/Widgets/vrtical_list_view_builder.dart';
import 'package:jobsque_jobfinder/services/api_service.dart';

class JopUnite2ListViewFuturebuilder extends StatelessWidget {
  const JopUnite2ListViewFuturebuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: JobsApiService.fetchSugessttedJobs(),
        builder: (context, snapshot) {
          if (!snapshot.hasError) {
            if (snapshot.connectionState == ConnectionState.done) {
              return VirticalListViewBuilder(jopesInfo: snapshot.data!);
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
        });
  }
}
