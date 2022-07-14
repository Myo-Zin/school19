
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restart_app/restart_app.dart';
import 'package:school19/app_start_up_controller.dart';
import 'package:school19/shared_pref.dart';
import 'package:school19/widget/loading_dialog_widget.dart';



showLogoutDialog(BuildContext context, WidgetRef ref) {
  showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: Text(
          "အကောင့်မှထွက်ရန်သေချာပါသလား?",
          style:  Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          TextButton(
              child: Text("ပယ်ဖျက်မည်"),
              onPressed: () => Navigator.pop(context)),
          TextButton(
              child: const Text(
                "သေချာသည်",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () async {
                loadingDialog(context);
                //await ref.read(authServiceProvider).logout();
                Navigator.pop(context);
                await ref.read(sharePrefServiceProvider).clear();

                await ref.refresh(appStartUpProvider.notifier).init();
                Restart.restartApp();

                Navigator.pop(context);
                Navigator.pop(context);
              }),
        ],
      ));
}