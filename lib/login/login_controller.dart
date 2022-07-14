
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/response_model.dart';

import 'login_repository.dart';
import 'login_response_model.dart';

final loginStateProvider = StateProvider<LoginResponse?>((_)=> null);
final loginViewController = Provider((ref){
  return LoginViewController(ref);
});

final sendFeedbackStateProvider = StateProvider<StatusResponse?>((_)=> null);

class LoginViewController{
  final ProviderRef ref;

  LoginViewController(this.ref);
  Future login(TextEditingController phoneNumberTextEditingController,TextEditingController passwordTextEditingController) async{
    final String phoneNumber = phoneNumberTextEditingController.text;
    final String  password = passwordTextEditingController.text;
    final loginRepository = ref.watch(loginRepositoryProvider);

    try{
      final result = loginRepository.login( phoneNumber, password);
      result.then((value) => ref.read(loginStateProvider.notifier).state = value as LoginResponse? );

    }on DioError catch(e){
      final error = e.response== null
          ? "something went wrong!"
          : e.response?.data['message'] ?? "something went wrong!";
      ref.read(loginStateProvider.notifier).state = error;
    }

  }
  Future sendFeedback(String message) async{
    final loginRepo = ref.watch(loginRepositoryProvider);
    try{
      final result = loginRepo.sendFeedback(message);
      result.then((value) => ref.read(sendFeedbackStateProvider.notifier).state =value );

    }on DioError catch(e){
      final error = e.response== null
          ? "something went wrong!"
          : e.response?.data['message'] ?? "something went wrong!";
      ref.read(sendFeedbackStateProvider.notifier).state = error;
    }

  }
}

class PasswordShowHideState extends StateNotifier<bool> {
  PasswordShowHideState() : super(true);

  void toggleShowHide() {
    state = !state ;
  }

}

final showHideProvider =
StateNotifierProvider<PasswordShowHideState, bool>((ref) => PasswordShowHideState());

