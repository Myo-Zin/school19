
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'environment_config.dart';

final dioProvider = Provider < Dio > ((ref) {
  return Dio(BaseOptions(
    baseUrl: EnvironmentConfig.BASE_URL,
  ));
});