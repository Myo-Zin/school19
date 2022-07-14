import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school19/announcement/announcement_controller.dart';
import 'package:school19/widget/loading_widget.dart';
import 'package:school19/widget/slider_widget.dart';

class SchoolPage extends ConsumerStatefulWidget {
  final String from;

  const SchoolPage(this.from, {Key? key}) : super(key: key);

  @override
  ConsumerState<SchoolPage> createState() => _SchoolPageState();
}

class _SchoolPageState extends ConsumerState<SchoolPage> {
  @override
  Widget build(BuildContext context) {
    final schoolResponse = ref.watch(schoolResponseController);
    final announcementResponse = ref.watch(announcementHomeController);
    return Scaffold(
      appBar: widget.from == "home"? AppBar(title: Text('ကျောင်း'),): null,
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            children: [
              Image(
                image: const AssetImage("assets/image-1.png"),
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: 160,
              ),
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
                    child: schoolResponse.when(data: (data){
                      final school = data.school;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${school?.name}",
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('ကိုယ်ပိုင်အထက်တန်းကျောင်း'),
                          ),
                          if (widget.from == "logout")
                            announcementResponse.when(
                                data: (data) {
                                  return CustomTextSlider(
                                      announcementList: data.announcementList??[],
                                      grade: [],
                                      sliderAspectRatio:  2,
                                      sliderColor:
                                      Theme.of(context).colorScheme.secondary,
                                      isHorizontal: false);
                                },
                                error: (err, str) {
                                  return Text("");
                                },
                                loading: () => loading()),
                          Row(
                            children: [
                              Icon(Icons.info,
                                  size: 20,
                                  color: Theme.of(context).colorScheme.primary),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child:
                                  Text('ကိုယ်ပိုင်${school?.level}ကျောင်းဖြစ်သည်။'),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.phone,
                                  size: 20,
                                  color: Theme.of(context).colorScheme.primary),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text('${school?.contactPhone1},${school?.contactPhone2}'),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.mail,
                                  size: 20,
                                  color: Theme.of(context).colorScheme.primary),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text('${school?.email}'),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.language,
                                  size: 20,
                                  color: Theme.of(context).colorScheme.primary),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text('${school?.website}'),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.facebook,
                                  size: 20,
                                  color: Theme.of(context).colorScheme.primary),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text('${school?.facebook}'),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on_sharp,
                                  size: 20,
                                  color: Theme.of(context).colorScheme.primary),

                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                      '${school?.address},${school?.city?.name},${school?.stateRegion?.name}'),
                                ),
                              )
                            ],
                          ),
                          // GestureDetector(
                          //   child: Text(
                          //     'မိမိ၏ကျောင်းသားအချက်အလက်များ ကြည့်ရှုရန်',
                          //     style: TextStyle(
                          //       color: Theme.of(context).colorScheme.secondary,
                          //       fontWeight: FontWeight.bold,
                          //       decoration: TextDecoration.underline,
                          //     ),
                          //   ),
                          //   onTap: (){
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) =>
                          //             const LoginPage()));
                          //   },
                          // ),
                        ],
                      );
                    }, error: (error,stack){
                      print("$error");
                      return Text("");
                    }, loading:() => loading())
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
