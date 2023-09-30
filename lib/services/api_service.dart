import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jobsque_jobfinder/Core/Utils/app_images.dart';
import 'package:jobsque_jobfinder/Features/Home_Screen&Search/models/suggested_jop_model.dart';

abstract class JobsApiService {
  static const String _baseUrl = "https://project2.amit-learning.com/api";
  static Future<List<SuggestedJopModel>> fetchSugessttedJobs() async {
    try {
      final dio = Dio();
      var response = await dio.get(_baseUrl);
      log(response.toString());

      List<SuggestedJopModel> jobs = parseData(response);
      return jobs;
    } catch (e) {
      if (e is DioException) {
        var message = e.error.toString();
        return jopesInfo;
      }
      throw Exception("somting went wrong try later");
    }
  }

  static List<SuggestedJopModel> parseData(Response<dynamic> response) {
    List<SuggestedJopModel> jobs = [];
    var items = response.data['data'];
    for (var jobMap in items) {
      jobs.add(SuggestedJopModel.fromJson(jobMap));
    }
    return jobs;
  }
}

List<SuggestedJopModel> jopesInfo = [
  SuggestedJopModel(
    jopImage: AppImages.zoomIcon,
    jopName: "Test Engineers",
    jopTimeType: "Fulltime",
    jopType: "Instructor",
    jopLevel: "3",
    salary: r"$12K-15K",
    aboutCompany: "",
    companyEmail: "",
    companyName: "",
    companyWebsite: "",
    jopDescription: "",
    jopId: 1,
    jopLocation: "",
    jopSkills: "",
  ),
  SuggestedJopModel(
    jopImage: AppImages.zoomIcon,
    jopName: "Product Designer",
    jopTimeType: "Fulltime",
    jopType: "Instructor",
    jopLevel: "2",
    salary: r"$12K-15K",
    aboutCompany: "",
    companyEmail: "",
    companyName: "",
    companyWebsite: "",
    jopDescription: "",
    jopId: 3,
    jopLocation: "",
    jopSkills: "",
  ),
  SuggestedJopModel(
    jopImage: AppImages.zoomIcon,
    jopName: "Product Designer",
    jopTimeType: "Fulltime",
    jopType: "Instructor",
    jopLevel: "2",
    salary: r"$12K-15K",
    aboutCompany: "",
    companyEmail: "",
    companyName: "",
    companyWebsite: "",
    jopDescription: "",
    jopId: 3,
    jopLocation: "",
    jopSkills: "",
  ),
];
