
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/daily_report/daily_report_model.dart';
import 'package:school19/daily_report/daily_report_repository.dart';
import 'package:school19/my_parameter.dart';
import 'package:school19/response_model.dart';

final dailyReportController = FutureProvider.family<DailyReportResponse,MyParameter>((ref,myParam) async {
  final result = ref.read(dailyReportRepositoryProvider).getDailyReport(myParam);
  return result;
});

final createDailyReportStateProvider = StateProvider<StatusResponse?>((_)=> null);

final createDailyReportViewController = Provider((ref){
  return CreateDailyReportViewController(ref);
});

class CreateDailyReportViewController {
  final ProviderRef ref;

  CreateDailyReportViewController(this.ref);

  Future createDailyReport(String gradeId,String classId,String subjectId,String body) async{
    final repo = ref.watch(dailyReportRepositoryProvider);
    try{
      final result = repo.createDailyReport(gradeId,classId,subjectId,body);
      result.then((value) => ref.read(createDailyReportStateProvider.notifier).state =value );

    }on DioError catch(e){
      final error = e.response== null
          ? "something went wrong!"
          : e.response?.data['message'] ?? "something went wrong!";
      ref.read(createDailyReportStateProvider.notifier).state = error;
    }

  }
}