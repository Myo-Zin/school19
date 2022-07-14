

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/login/login_response_model.dart';
import 'package:school19/response_model.dart';
import 'package:school19/shared_pref.dart';


import '../main_provider.dart';

final loginRepositoryProvider = Provider<LoginRepository>(
      (ref) {
    return LoginRepository(ref);
  },
);

class LoginRepository {
  LoginRepository(this.ref);
  final Ref ref;
  Future<LoginResponse> login(String phoneNumber, String password) async {
    final data = {
      'phoneNo': phoneNumber,
      "password" : password,
    };
    final dio = ref.watch(dioProvider);
    try{
      final response = await dio.post('/user/login',data: data);
      return LoginResponse.fromJson(response.data);
    }on DioError {
      rethrow;
    }
  }
  Future<StatusResponse> sendFeedback(String message) async {
    final shp = ref.read(sharePrefServiceProvider);
    final account = await shp.getAccount();
    final userId = account?.userId;
    final token = account?.token;
    final data = {
      "userId": userId,
      "message": message
    };
    final dio = ref.watch(dioProvider);
    try {
      final response = await dio.post('/feedback/create',
          data: data, options: Options(headers: {"token": token}));
      return StatusResponse.fromJson(response.data);
    } on DioError {
      rethrow;
    }
  }
}
