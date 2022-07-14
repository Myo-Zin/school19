
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/school/school_detail_model.dart';

import 'announcement_repository.dart';
import 'announcement_response_model.dart';

final announcementController = FutureProvider<AnnouncementResponse>((ref) async {

  final result =  ref.read(announcementRepositoryProvider).getDataForAnnouncement();
  return result;
});

final announcementHomeController = FutureProvider<AnnouncementResponse>((ref) async {

  final result =  ref.read(announcementRepositoryProvider).getDataForAnnouncementHome();
  return result;
});

final schoolResponseController = FutureProvider<SchoolResponse>((ref) async {

  final result =  ref.read(announcementRepositoryProvider).getSchool();
  return result;
});
