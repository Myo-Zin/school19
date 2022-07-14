
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/main_provider.dart';
import 'package:school19/shared_pref.dart';
import 'package:school19/student/student_response_model.dart';


final studentRepositoryProvider = Provider<StudentRepository>(
      (ref) {
    return StudentRepository(ref);
  },
);

class StudentRepository {
  StudentRepository(this.ref);
  final Ref ref;
  Future<StudentResponse> getDataForStudent() async {
    final shp = ref.read(sharePrefServiceProvider);
    final account = await shp.getAccount();
    final userId = account!.userId;
    final token = account!.token;
    final paraMeters = {
      'userId': userId,
    };
    final dio = ref.watch(dioProvider);
    try{
      final response = await dio.get('/student/byParent',
          queryParameters: paraMeters,
          options: Options(headers: {"token": token}));
      return StudentResponse.fromJson(response.data);
    }on DioError {
      rethrow;
    }
  }
}