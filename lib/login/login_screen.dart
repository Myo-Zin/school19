
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:restart_app/restart_app.dart';
import 'package:school19/account.dart';
import 'package:school19/app_start_up_controller.dart';
import 'package:school19/login/login_controller.dart';
import 'package:school19/login/login_response_model.dart';
import 'package:school19/shared_pref.dart';
import 'package:school19/widget/loading_dialog_widget.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPage> createState() => _LoginPageSate ();
}

class _LoginPageSate extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context){
    final phoneTextEditingController = TextEditingController();
    final passwordTextEditingController = TextEditingController();
    ref.listen<LoginResponse?>(loginStateProvider, (previous, next) async {
      if (next == null) {
        return;
      }

      if(next.status == true){
        await ref.read(sharePrefServiceProvider).setAuthState(value: true);
        await ref.read(sharePrefServiceProvider).setAccount(
            value: Account(next.user!.boId,next.token));
        ref.refresh(appStartUpProvider.notifier).init();
        Restart.restartApp();
      }
      ///close loading
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(next.message.toString()),
      ));
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Image(image: AssetImage("assets/image-1.png"),),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16,bottom: 16),
                  child: Text("ဖုန်းနံပါတ်ရိုက်ထည့်ပါ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                PhoneNumberWidget(phoneTextEditingController: phoneTextEditingController),
                const Padding(
                  padding: EdgeInsets.only(top: 16,bottom: 16),
                  child: Text("စကားဝှက်ရိုက်ထည့်ပါ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                PasswordWidget(passwordTextEditingController: passwordTextEditingController),
                Padding(
                  padding: const EdgeInsets.only(top: 16,bottom: 16),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'စကားဝှက်မေ့နေသည်',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'အကောင့်ဖွင့်မည်',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16,bottom: 16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo, // background
                      onPrimary: Colors.white, // foreground
                      minimumSize: Size.fromHeight(50),

                      shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: () {
                      loadingDialog(context);
                      ref.read(loginViewController).login(phoneTextEditingController, passwordTextEditingController);
                    },
                    child: Text('အကောင့်ဝင်မည်'),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({
    Key? key,
    required this.phoneTextEditingController,
  }) : super(key: key);

  final TextEditingController phoneTextEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneTextEditingController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
        const EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class PasswordWidget extends ConsumerWidget {
  const PasswordWidget({
    Key? key,
    required this.passwordTextEditingController,
  }) : super(key: key);

  final TextEditingController passwordTextEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isShowHide =  ref.watch(showHideProvider.select((value) => value));
    return TextFormField(
      controller: passwordTextEditingController,
      obscureText: isShowHide,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
          const EdgeInsets.only(left: 16.0, bottom: 8.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          suffixIcon:  IconButton(
            icon:  isShowHide?
            Icon(Icons.visibility_off, color: Theme.of(context).colorScheme.primary,):
            Icon(Icons.visibility, color: Theme.of(context).colorScheme.primary,),
            onPressed: () {
            ref.read(showHideProvider.notifier).toggleShowHide();
            },)
      ),
    );
  }
}