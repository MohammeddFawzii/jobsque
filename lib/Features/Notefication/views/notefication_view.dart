import 'package:flutter/material.dart';
import 'package:jobsque_jobfinder/Core/Wedgits/custom_app_bar.dart';
import 'package:jobsque_jobfinder/Features/Notefication/widgets/notefication_list_empty_page.dart';
import 'package:jobsque_jobfinder/Features/Notefication/widgets/notefication_list_not_empty_page.dart';

class NoteficationView extends StatelessWidget {
  NoteficationView({super.key});
  static const id = "noteficationveiw";
  bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Notification",
        paddingTop: 16,
      ),
      body: isEmpty
          ? const SafeArea(child: NoteficationListEmptyPage())
          : const SafeArea(child: NoteficationListNotEmptyPage()),
    );
  }
}
