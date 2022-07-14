import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/announcement/announcement_controller.dart';
import 'package:school19/announcement/announcement_list_screen.dart';
import 'package:school19/change_password/password_change_screen.dart';
import 'package:school19/feeback/feeback_screen.dart';
import 'package:school19/help/help_screen.dart';
import 'package:school19/home_work/home_work_screen.dart';
import 'package:school19/school/school_screen.dart';
import 'package:school19/widget/alert_dialog_widget.dart';
import 'package:school19/widget/loading_widget.dart';
import '../widget/slider_widget.dart';


class LogInHomePage extends ConsumerWidget {
  const LogInHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final announcementResponse = ref.watch(announcementController);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          // height: MediaQuery.of(context).size.height * .40,
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            children: [
              announcementResponse.when(data: (data){
                return CustomTextSlider(
                    announcementList: data.announcementList??[],
                    grade: [],
                    sliderAspectRatio: 2.1,
                    sliderColor: Theme.of(context).colorScheme.primary,
                    isHorizontal: false);
              }, error: (error,stack){
                return Text('');
              },
                  loading: ()=> loading()),

              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 16.0,),
                      CustomTextSlider(
                        announcementList: [],
                        grade:["မြန်မာ ၇၀မှတ်","အင်္ဂလိမ် ၈၀မှတ်"],
                        sliderAspectRatio: 3.2,
                        isHorizontal: true,
                        sliderBoxDecoration: BoxDecoration(
                          border:
                          Border.all(color: Colors.grey),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(10)),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //         const CreatePaymentPage()));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xfffc0b76e),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                                  height: 120,
                                  alignment: Alignment.center,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Daily Report',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeWorkPage()));
                                },
                                child: Container(
                                  height: 120,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFF97d28d),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                                  alignment: Alignment.center,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'အိမ်စာများ',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const AnnouncementListPage()),
                                  );
                                },
                                child: Container(
                                  height: 120,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFFa56160),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                                  alignment: Alignment.center,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'ကြေငြာချက်များ',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                           const SchoolPage("home")));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFF91d9cd),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                                  height: 120,
                                  alignment: Alignment.center,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'ကျောင်း',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const HelpPage()));
                                },
                                child: Container(
                                  height: 120,
                                  decoration: const BoxDecoration(
                                      color: Color(0xfff8182d0),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                                  alignment: Alignment.center,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'အကူအညီရယူမည်',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const FeedbackPage()),
                                  );
                                },
                                child: Container(
                                  height: 120,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFFe5a2e5),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                                  alignment: Alignment.center,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'အကြံပြုမည်',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  const ChangePasswordPage("login")),
                                  );
                                },
                                child: Container(
                                  height: 120,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFFc88f7c),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                                  alignment: Alignment.center,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'စကားဝှက်ပြောင်းမည်',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  showLogoutDialog(context,ref);
                                },
                                child: Container(
                                  height: 120,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFF738fc8),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                                  alignment: Alignment.center,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'အကောင့်မှထွက်မည်',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => AllTeacherPage()),
                                  // );
                                },
                                child: Container(
                                  height: 120,
                                  decoration: const BoxDecoration(
                                    //color: Color(0xFFFc3cfb3),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                                  alignment: Alignment.center,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      '',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )),

                        ],
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
