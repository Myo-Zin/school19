
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/main_provider.dart';
import 'package:school19/school/school_detail_model.dart';
import 'package:school19/shared_pref.dart';
import 'announcement_response_model.dart';

final announcementRepositoryProvider = Provider<AnnouncementRepository>(
      (ref) {
    return AnnouncementRepository(ref);
  },
);

class AnnouncementRepository {
  AnnouncementRepository(this.ref);
  final Ref ref;
  Future<AnnouncementResponse> getDataForAnnouncement() async {
    final shp = ref.read(sharePrefServiceProvider);
    final account = await shp.getAccount();
    final userId = account?.userId;
    final token = account?.token;
    final paraMeters = {
      'userId': userId,
    };
    final dio = ref.watch(dioProvider);
    try{
      final response = await dio.get('/announcement/listforparent',
          queryParameters: paraMeters,
          options: Options(headers: {"token":token}));
      return AnnouncementResponse.fromJson(response.data);
    }on DioError {
      rethrow;
    }
  }
  Future<AnnouncementResponse> getDataForAnnouncementHome() async {

    final dio = ref.watch(dioProvider);
    try{
      final response = await dio.get('/announcement/list');
      return AnnouncementResponse.fromJson(response.data);
    }on DioError {
      rethrow;
    }
  }

  Future<SchoolResponse> getSchool() async {

    final dio = ref.watch(dioProvider);
    try{
      final response = await dio.get('/home/school');
      return SchoolResponse.fromJson(response.data);
    }on DioError {
      rethrow;
    }
  }


}