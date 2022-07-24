

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/daily_report/daily_report_model.dart';
import 'package:school19/main_provider.dart';
import 'package:school19/my_parameter.dart';
import 'package:school19/response_model.dart';
import 'package:school19/shared_pref.dart';

final dailyReportRepositoryProvider = Provider<DailyReportRepository>(
      (ref) {
    return DailyReportRepository(ref);
  },
);

class DailyReportRepository {
  DailyReportRepository(this.ref);
  final Ref ref;
  Future<DailyReportResponse> getDailyReport(MyParameter parameter) async {
    final shp = ref.read(sharePrefServiceProvider);
    final account = await shp.getAccount();
    final userId = account!.userId;
    final token = account!.token;
    final data = {
      'userId': userId,
      "gradeId": parameter.gradeId,
      "classId": parameter.classId,
      "subjectId":"",
      "page":"1"
    };
    final dio = ref.watch(dioProvider);
    try{
      final response = await dio.post('/dailyreport/list',
          data: data,
          options: Options(headers: {"token": token}));
      return DailyReportResponse.fromJson(response.data);
    }on DioError {
      rethrow;
    }
  }
  Future<StatusResponse> createDailyReport(String gradeId,String classId,String subjectId,String body) async {
    final shp = ref.read(sharePrefServiceProvider);
    final account = await shp.getAccount();
    final userId = account!.userId;
    final token = account!.token;
    final data = {
      'userId': userId,
      "gradeId": gradeId,
      "classId": classId,
      "subjectId":subjectId,
      "body": body,
    };
    final dio = ref.watch(dioProvider);
    try{
      final response = await dio.post('/dailyreport/create',
          data: data,
          options: Options(headers: {"token": token}));
      return StatusResponse.fromJson(response.data);
    }on DioError {
      rethrow;
    }
  }
}
